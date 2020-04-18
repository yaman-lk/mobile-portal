import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:inna_thanak/Utils/network.dart';
import 'dart:async';

import 'Users/Annex/single_annex.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map profileDetail;
  List postedAds;
  String name;
  String email;

  @override
  void initState() {
    super.initState();
    this.fetchPostedBordings();
    this.fetchProfile();
  }

  Future fetchProfile() async {
    var dio = Dio();
    Response response = await dio.get("${NetworkDataPaser.url}" + "userProfile",
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer " + NetworkDataPaser.accesstoken
        }));
    response.statusCode == 200
        ? profileDetail = response.data
        : print(response.statusCode);

    setState(() {
      name = profileDetail['user']['name'];
      email = profileDetail['user']['email'];
    });
    print(name);
  }

  Future fetchPostedBordings() async {
    var dio = Dio();
    Response detailresponse = await dio.get(
        "${NetworkDataPaser.url}" + "postedBordings",
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer " + NetworkDataPaser.accesstoken
        }));

    detailresponse.statusCode == 200
        ? postedAds = detailresponse.data
        : print(detailresponse.statusCode);
    print(postedAds[0]['location']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        _profileImageCard(),
        SizedBox(
          height: 50,
        ),
        _tempAd()
      ],
    );
  }

  Widget _profileImageCard() {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.weloveglasses.com/wp-content/uploads/2016/11/black-slash-gold-forever21-spitfire-pro-tool-sunglasses-screen.jpg"))),
          ),
          Positioned(
            child: Card(
                color: Color(0xFF192A56),
                child: Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.weloveglasses.com/wp-content/uploads/2016/11/black-slash-gold-forever21-spitfire-pro-tool-sunglasses-screen.jpg"),
                        minRadius: 40,
                      ),
                      // profileDetail != null && profileDetail.length != null
                      Text(
                        "$name \n $email",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                )),
            right: MediaQuery.of(context).size.width / 15,
            left: MediaQuery.of(context).size.width / 15,
            top: MediaQuery.of(context).size.height / 4,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _tempAd() {
    return postedAds != null && postedAds.length != null && postedAds.length > 0
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: postedAds.length != null ? postedAds.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Card(
                  child: Container(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                      child: InkWell(
                        child: Column(
                          children: <Widget>[
                            Container(
                                alignment: new FractionalOffset(0.0, 1.0),
                                child: postedAds != null
                                    ? Text(
                                        "${postedAds[index]['bordingType']}"
                                                .toUpperCase() +
                                            " in " +
                                            "${postedAds[index]['location'].toString().toLowerCase()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      )
                                    : Text("Still loading")),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 10,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    color: Color(0xFFe81029),
                                  ),
                                )),
                            SizedBox(
                              height: 10.0,
                            ),
                            ImageFade(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4,
                              image: NetworkImage(postedAds != null
                                  ? postedAds[index]['images'][0]
                                  : ""),
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context, Widget child,
                                  dynamic exception) {
                                return Container(
                                  color: Color(0xFF6F6D6A),
                                  child: Center(
                                      child: Icon(Icons.music_video,
                                          color: Colors.black26, size: 128.0)),
                                );
                              },
                              loadingBuilder: (BuildContext context,
                                  Widget child, ImageChunkEvent event) {
                                if (event == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                      value: event.expectedTotalBytes == null
                                          ? 0.0
                                          : event.cumulativeBytesLoaded /
                                              event.expectedTotalBytes),
                                );
                              },
                              placeholder: Container(
                                color: Color(0xFFCFCDCA),
                                child: Center(
                                    child: Icon(
                                  Icons.photo,
                                  color: Colors.white30,
                                  size: 128.0,
                                )),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                " Rooms: ${postedAds[index]['numberOfRooms']} \n Bathrooms: ${postedAds[index]['numberOfBathrooms']}\n",
                                style: TextStyle(fontSize: 15),
                              ),
                              trailing: Text(
                                "Rs. ${postedAds[index]['rental']}/month",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                onTap: (){
                  NetworkDataPaser.singleAd = postedAds[index];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleAd()));
                },
              );
            })
        : Container(
            child: Center(
              child: Text("No posted ads found by you"),
            ),
          );
  }
}
