import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  String uploadUrl;
  static File _image;

  @override
  void initState() {
    super.initState();
    print(NetworkDataPaser.inquiryAd);
  }

  getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future uploadFile() async {
    final String fileName = DateTime.now().toString();
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child("inquiry-proofs/$fileName");
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    // await uploadTask.onComplete;
    print('File Uploaded');
    uploadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    print(uploadUrl);
    makeInquiry();
  }

  Future makeInquiry() async {
    var dio = Dio();

    final Map<String, dynamic> inqdata = {
      "bordingId": NetworkDataPaser.inquiryAd["_id"],
      "reason": _reason.text,
      "description": _description.text,
      "proofUrl": uploadUrl,
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
        _image == null
            ? Center(
                child: IconButton(
                    icon: Icon(Icons.camera),
                    onPressed: () {
                      getImage();
                    }))
            : Container(
                height: 200,
                width: 200,
                child: Image.file(_image),
              ),
        Center(
          child: RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                NetworkDataPaser.accesstoken != null
                    ? uploadFile()
                    : Toast.show("Please log in to make report", context);
              }),
        )
      ],
    );
  }
}
