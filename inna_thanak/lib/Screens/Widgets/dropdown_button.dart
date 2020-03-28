import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class DropDownButton extends StatefulWidget {
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String selectedKey;

  @override
  void initState() {
    selectedKey = keys[0];
    super.initState();
  }

  List<String> keys = ['All', 'Shared Rooms', 'Anexes', 'Houses'];

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      child: _buttonDesign(), // Widget displayed as the button
      items: keys, // List of your items
      topDivider: true,
      itemBuilder: (value) => Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(value)), // Widget displayed for each item
      toggledChild: Container(
        color: Colors.white,
        child: _buttonDesign(), // Widget displayed as the button,
      ),
      divider: Container(
        height: 1,
        color: Colors.grey,
      ),
      onItemSelected: (value) {
        selectedKey = value;
        // Action when new item is selected
      },
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: const BorderRadius.all(Radius.circular(3.0)),
          color: Colors.white),
      onMenuButtonToggle: (isToggle) {
        print(isToggle);
      },
    );
  }

  Widget _buttonDesign() {
    return SizedBox(
      width: 93,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                selectedKey,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
                width: 12,
                height: 17,
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ))),
          ],
        ),
      ),
    );
  }
}
