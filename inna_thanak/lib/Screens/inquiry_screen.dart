import 'package:flutter/material.dart';
import 'package:inna_thanak/Widgets/lable_text_field.dart';

class InquiryScreen extends StatefulWidget {
  @override
  _InquiryScreenState createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit inquiry"),
      ),
      body: _body(),
    );
  }

  Widget _body(){
    return ListView(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height/8,),
        LabelTextField(
          hintText: "Submit your reason",
          labelText: "Reason",
        ),
        SizedBox(height: 15),
        LabelTextField(
          hintText: "Submit your description",
          labelText: "Description",
        ),
        SizedBox(height: 15),
        Center(
          child: Icon(Icons.camera_enhance,size: 60,),
        ),
      ],
    );
  }
}