import 'package:flutter/material.dart';
import 'package:inna_thanak/Screens/Widgets/bottom_navigation.dart';
import './singlead_screen.dart';

class AdList extends StatefulWidget {
  @override
  _AdListState createState() => _AdListState();
}

class _AdListState extends State<AdList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    return ListView(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: new FractionalOffset(0.0, 1.0),
                    child: Text("Borella",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    // height: 230,
                    child: Image.network("http://www.bayfieldinn.com/sites/bayfieldinn.com/files/content/rentals/DSC_0097.JPG")
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("rooms:1 beds:3 baths:2")),
                        Expanded(child: Text("Rs.2000/month",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)))
                      ],
                    ),
                  ),
                ],
              ),
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>SingleAd())),
              
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: new FractionalOffset(0.0, 1.0),
                    // padding: EdgeInsets.only(right: 315.0),
                    child: Text("Nugegoda",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    // height: 230,
                    child: Image.network("http://www.bayfieldinn.com/sites/bayfieldinn.com/files/content/rentals/DSC_0084.JPG")
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("rooms:1 beds:3 baths:2")),
                        Expanded(child: Text("Rs.2000/month",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)))
                      ],
                    ),
                  ),
                ],
              ),
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>SingleAd())),
              
            )
          ),
      ],
    );
  }
}