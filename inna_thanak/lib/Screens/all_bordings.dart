import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:inna_thanak/Screens/inquiry_screen.dart';
import 'package:inna_thanak/Utils/network.dart';

import 'Users/Annex/single_annex.dart';

class AllBordings extends StatefulWidget {
  @override
  _AllBordingsState createState() => _AllBordingsState();
}

class _AllBordingsState extends State<AllBordings> {
  List allBordings;

  //Making http request

  Future getallBordings(BuildContext context) async {
    var dio = Dio();

    Response response = await dio.get('${NetworkDataPaser.url}' + 'allBordings',
        options: Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        }));

    response.statusCode == 200
        ? allBordings = response.data
        : allBordings = null;

    print(response.data[0]['images'][0]);
  }

  @override
  void initState() {
    super.initState();
    this.getallBordings(context);
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
                    padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    child: InkWell(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    alignment: new FractionalOffset(0.0, 1.0),
                                    child: Text(
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
                                    )),
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
                              height: MediaQuery.of(context).size.height / 4,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context, Widget child,
                                  dynamic exception) {
                                return Container(
                                  color: Color(0xFF6F6D6A),
                                  child: Center(
                                      child: Icon(Icons.warning,
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
                              image: NetworkImage(
                                  "$allBordings[index]['images'][0]" != null
                                      ? "$allBordings[index]['images'][0]"
                                      : ""),
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
                          NetworkDataPaser.passedID = allBordings[index]['_id'];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleAd()));
                          print(NetworkDataPaser.passedID);
                        })),
              );
            },
          )
        : Container();
  }
}
