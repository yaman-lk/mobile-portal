import 'package:flutter/material.dart';
import 'package:inna_thanak/Widgets/lable_text_field.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        // backgroundColor:  ,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      // color: Colors.black,
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: <Widget>[
         Center(
           child: LabelTextField(
             hintText: "Enter email",
             labelText: "Email",
           ),
         )
        ],
      ),
    );
  }
}
