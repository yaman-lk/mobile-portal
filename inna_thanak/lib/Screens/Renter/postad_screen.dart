import 'package:flutter/material.dart';
import './postedad_screen.dart';

class PostAdScreen extends StatefulWidget {
  @override
  _PostAdScreenState createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
  Widget _body(){
    return Center(
      child: InkWell(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PostedAdsScreen())),
        child: Text("Post ad screen"),
      ),
    );
  }
}