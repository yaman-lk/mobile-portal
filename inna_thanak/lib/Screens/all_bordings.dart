import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:inna_thanak/Screens/Authentication/signin_screen.dart';
import 'package:inna_thanak/Screens/inquiry_screen.dart';
import 'package:inna_thanak/Utils/network.dart';
import 'package:inna_thanak/Utils/network.dart' as prefix0;

import 'Users/Annex/single_annex.dart';

class AllBordings extends StatefulWidget {
  @override
  _AllBordingsState createState() => _AllBordingsState();
}

class _AllBordingsState extends State<AllBordings> {
  List allBordings;

  @override
  void initState() {
    super.initState();
    this.getallBordings(context);
  }

  //Making http request
  Future getallBordings(BuildContext context) async {
    var dio = Dio();

    Response response = await dio.get('${NetworkDataPaser.url}' + 'allBordings',
        options: Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        }));

    if (this.mounted) {
      setState(() {
        response.statusCode == 200
            ? allBordings = response.data
            : allBordings = null;
      });
      // dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return _singleAdCard();
  }

  Widget _singleAdCard() {
    return allBordings != null &&
            allBordings.length != null &&
            allBordings.length > 0
        ? ListView.builder(
            itemCount: allBordings.length != null ? allBordings.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                    child: InkWell(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                allBordings != null
                                    ? Column(children: [
                                        Text(
                                          allBordings[index]['bordingType']
                                                  .toString()
                                                  .toUpperCase() +
                                              " in " +
                                              allBordings[index]['location']
                                                  .toString()
                                                  .toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Container(
                                                height: 10,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                color: Color(0xFFe81029),
                                              ),
                                            )),
                                      ])
                                    : Container(),
                                IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InquiryScreen()))),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ImageFade(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4,
                              image: NetworkImage(allBordings != null
                                  ? allBordings[index]['images'][0]
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
                                allBordings[index]['bordingType'] == "house"
                                    ? " Rooms: ${allBordings[index]['numberOfRooms']} \n Bathrooms: ${allBordings[index]['numberOfBathrooms']}\n"
                                    : " Rooms: ${allBordings[index]['numberOfRooms']} \n Bathrooms: ${allBordings[index]['numberOfBathrooms']}\n",
                                style: TextStyle(fontSize: 15),
                              ),
                              trailing: Text(
                                "Rs. ${allBordings[index]['rental']}/month",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          prefix0.NetworkDataPaser.passedID = allBordings[index]['_id'].toString();
                          NetworkDataPaser.singleAd = allBordings[index];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleAd()));
                        })),
              );
            },
          )
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
