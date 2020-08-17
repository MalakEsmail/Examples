import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DropDownBut extends StatefulWidget {
  final Firestore _fireStore = Firestore.instance;

  @override
  _DropDownButState createState() => _DropDownButState();
}

class _DropDownButState extends State<DropDownBut> {
  String _selectedValue;
  // List _namesList = ["Java", "C++", "Dart", "C", "Python"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.blue),
          child: StreamBuilder<QuerySnapshot>(
              stream: widget._fireStore.collection('languages').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Text('Loading...'),
                  );
                }
                return DropdownButton(
                    // value .. items.. onChange
                    hint: Text('Select Language'),
                    dropdownColor: Colors.blueGrey,
                    isExpanded: true,
                    elevation: 5,
                    iconSize: 36,
                    style: TextStyle(color: Colors.pink, fontSize: 18.0),
                    value: _selectedValue,
                    items: snapshot.data.documents
                        .map((DocumentSnapshot documentSnapshot) {
                      return DropdownMenuItem(
                        child: Text(documentSnapshot.data['name']),
                        value: documentSnapshot.data['name'],
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedValue = val;
                      });
                    });
              }),
        ),
      ),
    );
  }
}
