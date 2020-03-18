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
    return Center(
        child: InkWell(
          child: Text("bodim places list (UI is in the group)"),
          onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>SingleAd())),
        )
      );
  }
}