import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inna_thanak/Utils/network.dart';
import 'package:inna_thanak/Widgets/lable_text_field.dart';
import 'package:toast/toast.dart';

class InquiryScreen extends StatefulWidget {
  @override
  _InquiryScreenState createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  TextEditingController _reason = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(NetworkDataPaser.inquiryAd);
  }

  Future makeInquiry() async {
    var dio = Dio();

    final Map<String, dynamic> inqdata = {
      "bordingId": NetworkDataPaser.inquiryAd["_id"],
      "reason": _reason.text,
      "description": _description.text,
      "proofUrl": "dnskjfjkfnjk",
    };

    if (NetworkDataPaser.accesstoken == null) {
      Toast.show("You have to log in to make report", context);
    } else {
      Response response = await dio
          .post("${NetworkDataPaser.url}" + "addInquiry", data: inqdata,
              onSendProgress: (int sent, int total) {
        print("$sent , $total");
      },
              options: Options(headers: {
                HttpHeaders.authorizationHeader:
                    "Bearer " + NetworkDataPaser.accesstoken
              }));

      response.statusCode == 200
          ? Toast.show("Report submitted. We will look into that", context)
          : Toast.show("Something is not right", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit inquiry"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
        ),
        LabelTextField(
          hintText: "Submit your reason",
          labelText: "Reason",
          textEditingController: _reason,
        ),
        SizedBox(height: 15),
        LabelTextField(
          hintText: "Submit your description",
          labelText: "Description",
          textEditingController: _description,
        ),
        SizedBox(height: 15),
        Center(
          child: Icon(
            Icons.camera_enhance,
            size: 60,
          ),
        ),
        Center(
          child: RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                makeInquiry();
              }),
        ),
      ],
    );
  }
}
