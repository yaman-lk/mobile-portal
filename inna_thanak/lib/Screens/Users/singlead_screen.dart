import 'package:flutter/material.dart';
import '../Renter/postad_screen.dart';

class SingleAd extends StatefulWidget {
  @override
  _SingleAdState createState() => _SingleAdState();
}

class _SingleAdState extends State<SingleAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        InkWell(
          child: Text("Single ad screen"),
        ),
         InkWell(
           onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>PostAdScreen())),
          child: Text("post ad screen"),
        ),
      ],
    );
  }
}
