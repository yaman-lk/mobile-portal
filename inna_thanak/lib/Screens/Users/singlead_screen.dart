import 'package:flutter/material.dart';
import 'package:inna_thanak/Screens/Widgets/bottom_navigation.dart';
import '../Renter/postad_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';

class SingleAd extends StatefulWidget {
  @override
  _SingleAdState createState() => _SingleAdState();
}

class _SingleAdState extends State<SingleAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: _body(),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _body() {
    return Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Center(
            child: SizedBox(
              height: 220.0,
              width: 375.0,
              child: Carousel(
                dotSize: 6.0,
                dotSpacing: 15.0,
                dotColor: Colors.blueAccent,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.purple.withOpacity(.01),
                images: [
                  NetworkImage("http://www.bayfieldinn.com/sites/bayfieldinn.com/files/content/rentals/DSC_0097.JPG"),
                  NetworkImage('http://hgtvhome.sndimg.com/content/dam/images/hgrm/fullset/2013/7/5/0/DP_Wendy-Danziger-Guest-Bedroom-3_4x3.jpg.rend.hgtvcom.1280.960.jpeg'),
                  // ExactAssetImage("assets/images/LaunchImage.jpg")
                          ],
                showIndicator: true,
                moveIndicatorFromBottom: 180.0,
                noRadiusForIndicator: true,
                overlayShadow: true,
                overlayShadowColors: Colors.white,
                overlayShadowSize: 0.7,
              )
            ),
          ),
          SizedBox(height: 5.0,),
          Container(
            alignment: new FractionalOffset(.95, 0.0),
            child: RaisedButton(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                 borderRadius: new BorderRadius.circular(18.0),
                 side: BorderSide(color: Colors.blueAccent)
                ), 
              child: Text("  Add to \nfavourites",style: TextStyle(fontSize: 12.0),),             
              onPressed: () {},
            )
          ),
          Container(
            alignment: new FractionalOffset(0.05, 0.0),
            child: Text("Price",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),Container(
            alignment: new FractionalOffset(0.05, 0.0),
            child: Text("Key money",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),Container(
            alignment: new FractionalOffset(0.05, 0.0),
            child: Text("Rooms",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),Container(
            alignment: new FractionalOffset(0.05, 0.0),
            child: Text("Beds",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),Container(
            alignment: new FractionalOffset(0.05, 0.0),
            child: Text("Price",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),Container(
            alignment: new FractionalOffset(0.05, 0.0),
            child: Text("Bathrooms",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),Container(
            alignment: new FractionalOffset(0.05, 0.0),
            child: Text("Descriptions",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),Container(
            alignment: new FractionalOffset(0.05, 0.0),
            child: Text("Contact",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
        ],
    );
  }
}
