import 'package:flutter/material.dart';
import 'package:inna_thanak/Screens/Widgets/bottom_navigation.dart';
import './singlead_screen.dart';
import 'package:image_fade/image_fade.dart';

class AdList extends StatefulWidget {
  @override
  _AdListState createState() => _AdListState();
}

class _AdListState extends State<AdList> {
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

  Widget _body() {
    return ListView(
      children: <Widget>[
        _singleAdCard(),
        _singleAdCard(),
      ],
    );
  }

  Widget _singleAdCard() {
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
                  leading: Text("Rooms: 1 Beds: 3 Baths: 2"),
                  trailing: Text(
                    "Rs. 2000/month", 
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SingleAd())),
          )),
    );
  }
}
