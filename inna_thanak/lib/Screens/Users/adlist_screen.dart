import 'package:flutter/material.dart';
import './singlead_screen.dart';

class AdList extends StatefulWidget {
  @override
  _AdListState createState() => _AdListState();
}

class _AdListState extends State<AdList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
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