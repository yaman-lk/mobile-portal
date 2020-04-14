import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'dart:async';

import 'package:inna_thanak/models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<Profile> futureProfile;
  Response response;
  List profileDetails;

  @override
  void initState() {
    futureProfile = Profile.getProfile();
    super.initState();
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
        SizedBox(height: 50),
        // SizedBox(height: 50),
        _tempAd(),
        _tempAd(),
        _tempAd(),
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
                        "https://orig07.deviantart.net/d05d/f/2016/073/f/2/thebestcubehd_by_eonofre12-d9v50ra.png"))),
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
                            "https://orig07.deviantart.net/d05d/f/2016/073/f/2/thebestcubehd_by_eonofre12-d9v50ra.png"),
                        minRadius: 40,
                      ),
                      Text(
                        "Ads posted\n (12)",
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
    return Card(
      child: Container(
          padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
          child: InkWell(
            child: Column(
              children: <Widget>[
                Container(
                    alignment: new FractionalOffset(0.0, 1.0),
                    child: Text(
                      "Borella",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 3,
                        color: Color(0xFFe81029),
                      ),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                ImageFade(
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (BuildContext context, Widget child, dynamic exception) {
                    return Container(
                      color: Color(0xFF6F6D6A),
                      child: Center(
                          child: Icon(Icons.warning,
                              color: Colors.black26, size: 128.0)),
                    );
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent event) {
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
                  image: NetworkImage(
                      "http://www.bayfieldinn.com/sites/bayfieldinn.com/files/content/rentals/DSC_0084.JPG"),
                ),
                ListTile(
                  leading: Text(
                    " Rooms: 2 \n Bathrooms: 2\n For: girls}",
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Text(
                    "Rs. 5000/month",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
