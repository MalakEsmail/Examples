import 'package:flutter/material.dart';

class DropDownBut extends StatefulWidget {
  @override
  _DropDownButState createState() => _DropDownButState();
}

class _DropDownButState extends State<DropDownBut> {
  String _selectedValue;
  List _namesList = ["Java", "C++", "Dart", "C", "Python"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.blue),
          child: DropdownButton(
              // value .. items.. onChange
              hint: Text('Select Language'),
              dropdownColor: Colors.blueGrey,
              isExpanded: true,
              elevation: 5,
              iconSize: 36,
              style: TextStyle(color: Colors.pink, fontSize: 18.0),
              value: _selectedValue,
              items: _namesList.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _selectedValue = val;
                });
              }),
        ),
      ),
    );
  }
}
