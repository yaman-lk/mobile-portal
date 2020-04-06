import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:inna_thanak/Screens/Users/SharedRoom/single_sharedroom.dart';
import 'package:inna_thanak/Utils/network.dart';
import 'package:inna_thanak/Widgets/bottom_navigation.dart';
import 'package:inna_thanak/models/sharedroom_model.dart';

class SharedRoomAdlist extends StatefulWidget {
  @override
  _SharedRoomAdlistState createState() => _SharedRoomAdlistState();
}

class _SharedRoomAdlistState extends State<SharedRoomAdlist> {
  static final sharedrooms = SharedRoom.fetchAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: Color(0xFF192A56),
        leading: Icon(Icons.person),
        title: Text("Inna Thanak"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: _body(),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _body(){
    return _singleAdCard();
  }

  Widget _singleAdCard(){
     return sharedrooms.length != null && sharedrooms != null && sharedrooms.length > 0
        ? ListView.builder(
            itemCount: sharedrooms.length != null ? sharedrooms.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                    padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    child: InkWell(
                        child: Column(
                          children: <Widget>[
                            Container(
                                alignment: new FractionalOffset(0.0, 1.0),
                                child: Text(
                                  sharedrooms[index].location,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                )),
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
                                  "http://www.bayfieldinn.com/sites/bayfieldinn.com/files/content/rentals/DSC_0084.JPG"),
                            ),
                            ListTile(
                              leading: Text(
                                " Rooms: ${sharedrooms[index].beds} \n Bathrooms: ${sharedrooms[index].bathrooms}\n For: ${sharedrooms[index].forWhome}",
                                style: TextStyle(fontSize: 15),
                              ),
                              trailing: Text(
                                "Rs. ${sharedrooms[index].rental}/month",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          NetworkDataPaser.passedID = sharedrooms[index].id;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleSharedRoom()));
                          print(NetworkDataPaser.passedID);
                        })),
              );
            },
          )
        : Container();
  }
  }
