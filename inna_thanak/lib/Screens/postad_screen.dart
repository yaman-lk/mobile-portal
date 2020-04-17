import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inna_thanak/Screens/Resources/resources.dart';
import 'package:inna_thanak/Widgets/lable_text_field.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PostAdScreen extends StatefulWidget {
  @override
  _PostAdScreenState createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  int _typeForFeatures;
  Widget _extraFacilities(String _on, String _off, IconData _icon) {
    return LiteRollingSwitch(
      //initial value
      value: true,
      textOn: _on,
      textOff: _off,
      colorOn: Colors.greenAccent[700],
      colorOff: Colors.redAccent[700],
      iconOn: _icon,
      iconOff: Icons.remove_circle_outline,
      textSize: 14.0,
      onChanged: (bool state) {
        //Use it to manage the different states
        print('Current State of SWITCH IS: $state');
      },
    );
  }

  Widget _sharedAndHouses() {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _extraFacilities("A/C", "No A/C", Icons.ac_unit),
          SizedBox(width: 10),
          _extraFacilities("Fans", "No Fans", FontAwesomeIcons.fan),
        ],
      ),
    );
  }

  Widget _annex() {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _extraFacilities("Furniture", "No Firniture", FontAwesomeIcons.chair),
          SizedBox(width: 10),
          _extraFacilities("Kitchen", "No Kitchen", FontAwesomeIcons.cookie),
          SizedBox(width: 10),
          _extraFacilities("A/C", "No A/C", Icons.ac_unit),
        ],
      ),
    );
  }

  Widget _bordingType() {
    return Center(
      child: ToggleSwitch(
        minWidth: 90.0,
        initialLabelIndex: 2,
        activeBgColor: Color(0xFF192A56),
        activeTextColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveTextColor: Colors.grey[900],
        labels: ['Annex', 'Shared room', 'House'],
        onToggle: (index) {
          setState(() {
            _typeForFeatures = index;
            _typeForFeatures = index;
          });
          print('switched to: $index');
        },
      ),
    );
  }

  Widget _recidentType() {
    return Center(
      child: ToggleSwitch(
        minWidth: 90.0,
        initialLabelIndex: 2,
        activeBgColor: Color(0xFF192A56),
        activeTextColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveTextColor: Colors.grey[900],
        labels: ['For girls', 'For boys', 'Not special'],
        onToggle: (index) {
          setState(() {});
          print('switched to: $index');
        },
      ),
    );
  }

  Widget _bedrooms(String _hint, String _lable) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: LabelTextField(
        hintText: _hint,
        labelText: _lable,
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _rooms(String _hint, String _lable) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: LabelTextField(
        hintText: _hint,
        labelText: _lable,
        keyboardType: TextInputType.number,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_bordingType()],
              ),
            ),
            SizedBox(height: 20),
            _typeForFeatures == 0 || _typeForFeatures == 1
                ? _sharedAndHouses()
                : _annex(),
            SizedBox(height: 20),
            _recidentType(),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Price",
                labelText: "Price",
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Key money",
                labelText: "Key money expected",
                keyboardType: TextInputType.number,
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
            _typeForFeatures == 0 || _typeForFeatures == 2
                ? _rooms("Rooms", "Number of Rooms")
                : SizedBox(),
            SizedBox(height: 10),
            _typeForFeatures == 0 || _typeForFeatures == 2
                ? _bedrooms("Bedrooms", "Number of bedrooms")
                : _bedrooms("Beds", "Number of beds"),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: LabelTextField(
                hintText: "Description",
                labelText: "Description",
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 5, 120, 10),
              child: Container(
                  child: ButtonTheme(
                      child: IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  color: Color(Resources.primarycolor),
                ),
                onPressed: () {
                  print("Tapped");
                },
                iconSize: 100,
              ))),
            ),
          ],
        )),
      ),
    );
  }
}
