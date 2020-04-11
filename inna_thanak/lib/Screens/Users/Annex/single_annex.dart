import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:inna_thanak/Widgets/bottom_navigation.dart';
import 'package:inna_thanak/Widgets/features_chips.dart';
import 'package:inna_thanak/models/annex_model.dart';

class SingleAd extends StatefulWidget {
  @override
  _SingleAdState createState() => _SingleAdState();
}

class _SingleAdState extends State<SingleAd> {

  static final allAnnexs = Annex.fetchAll();
  final singleAnnex = allAnnexs[2];
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            singleAnnex.isKitchen == true
                ? FeaturedChip("Kitchen", Color(0xFF192A56))
                : FeaturedChip("No kitchen", Colors.black),
            singleAnnex.isAC == true
                ? FeaturedChip("With A/C", Color(0xFF192A56))
                : Chip(label: Text("Without A/C")),
            singleAnnex.isFurniture == true
                ? FeaturedChip("With furniture", Color(0xFF192A56))
                : FeaturedChip("Without furniture", Colors.black),
            singleAnnex.isNegotiable == true
                ? FeaturedChip("Neotiable", Color(0xFF192A56))
                : Chip(label: Text("No bargain")),
          ],
        ),
        Card(
          child: ListTile(
            leading:
                Text("Rental :", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("Rs. ${singleAnnex.rental}/month",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Keymoney :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("Rs. ${singleAnnex.keyMoney}",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Rooms :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("${singleAnnex.rooms}",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Barthrooms :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("${singleAnnex.bathrooms}",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "For :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("${singleAnnex.recidentType}",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Text(
              "Description :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Text("${singleAnnex.description}",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
              height: 50,
              color: Colors.green,
              child: Center(
                child: Text(
                  "${singleAnnex.contactNumber}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
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
