import 'package:flutter/material.dart';

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
                  //this container has the image add icon
                  child: ButtonTheme(
                      child: IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () {
                  print("Tapped");
                },
                iconSize: 100,
              ))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Price",
                      hintText: "Price",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))))),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "KeyMoney",
                      hintText: "KeyMoney",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))))),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Address",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))))),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Rooms",
                      hintText: "Rooms",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))))),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Beds",
                      hintText: "Beds",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))))),
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "Description",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))))),
            ),
          ],
        )),
      ),
    );
  }
}
