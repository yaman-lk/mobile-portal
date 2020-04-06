import 'package:flutter/material.dart';

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
    return Container(
      child: Center(
        child: Text("Posting ads"),
      ),
    );
  }
}