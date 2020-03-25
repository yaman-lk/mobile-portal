import 'package:flutter/material.dart';
import 'package:inna_thanak/Screens/Widgets/bottom_navigation.dart';
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
        backgroundColor: Color(0xFF192A56),
      ),
      body: _body(),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 10.0),
        _corouselImages(),
        SizedBox(height: 5.0),
        _favButton(),
        Card(
          child: ListTile(
            leading:
                Text("Price :", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("Rs. 2000/month",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Keymoney :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing:
                Text("Rs. 2000", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Rooms :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing:
                Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Barthrooms :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing:
                Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Beds :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing:
                Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Description :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing:
                Text("_description here", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(height: 20,),
        Center(
          child: Container(
            height: 50,
            color: Colors.green,
            child: Center(
              child: Text("Contact number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            )
          ),
        )
      ],
    );
  }

  Widget _corouselImages() {
    return Center(
      child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Carousel(
            dotSize: 6.0,
            dotSpacing: 15.0,
            dotColor: Colors.blueAccent,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.purple.withOpacity(.01),
            images: [
              NetworkImage(
                "http://www.bayfieldinn.com/sites/bayfieldinn.com/files/content/rentals/DSC_0097.JPG",
              ),
              NetworkImage(
                  'http://hgtvhome.sndimg.com/content/dam/images/hgrm/fullset/2013/7/5/0/DP_Wendy-Danziger-Guest-Bedroom-3_4x3.jpg.rend.hgtvcom.1280.960.jpeg'),
            ],
            showIndicator: true,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
          )),
    );
  }

  Widget _favButton() {
    return Container(
        alignment: new FractionalOffset(.95, 0.0),
        child: RaisedButton(
          color: Color(0xFF192A56),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blueAccent)),
          child: Text(
            "  Add to \nfavourites",
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          onPressed: () {},
        ));
  }
}
