import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:inna_thanak/Utils/network.dart';

import 'Users/Annex/single_annex.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List favorites;

  @override
  void initState() {
    this.fetchFavorites();
    super.initState();
  }

  Future fetchFavorites() async {
    var dio = Dio();
    Response response = await dio.get(
        "${NetworkDataPaser.url}" + "favouriteBordings",
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer " + NetworkDataPaser.accesstoken
        }));

    if (response.statusCode == 200) {
      setState(() {
        favorites = response.data;
      });
    } else {
      print("Error");
    }
    print(response.data);
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tempAd(),
    );
  }

  Widget _tempAd() {
    return favorites != null && favorites.length != null && favorites.length > 0
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: favorites.length != null ? favorites.length : 0,
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
                                child: favorites != null
                                    ? Text(
                                        "${favorites[index]['bordingType']}"
                                                .toUpperCase() +
                                            " in " +
                                            "${favorites[index]['location'].toString().toUpperCase()}",
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
                              image: NetworkImage(favorites != null
                                  ? favorites[index]['images'][0]
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
                                " Rooms: ${favorites[index]['numberOfRooms']} \n Bathrooms: ${favorites[index]['numberOfBathrooms']}\n",
                                style: TextStyle(fontSize: 15),
                              ),
                              trailing: Text(
                                "Rs. ${favorites[index]['rental']}/month",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                onTap: () {
                  NetworkDataPaser.singleAd = favorites[index];
                  NetworkDataPaser.isfavorite = true;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingleAd()));
                },
              );
            })
        : Container(
            child: Center(
              child: Text("No favorite ads found by you"),
            ),
          );
  }
}
