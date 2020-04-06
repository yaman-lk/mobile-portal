import 'package:flutter/material.dart';
import 'package:inna_thanak/Screens/Resources/resources.dart';
import 'package:inna_thanak/Widgets/lable_text_field.dart';

class PostAdScreen extends StatefulWidget {
  @override
  _PostAdScreenState createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  //final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 5, 120, 10),
              child: Container(
                  child: ButtonTheme(
                      child: IconButton(
                icon: Icon(Icons.add_a_photo,color: Color(Resources.primarycolor),),
                onPressed: () {
                  print("Tapped");
                },
                iconSize: 100,
              ))),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Price",
                labelText: "Price",
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Key money",
                labelText: "Key money expected",
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Address",
                labelText: "Location address",
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Rooms",
                labelText: "Number of rooms",
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Beds",
                labelText: "Number of beds",
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Description",
                labelText: "Description",
              ),
            ),
          ],
        )),
      ),
    );
  }
}
