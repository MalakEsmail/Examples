import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListViewEx extends StatefulWidget {
  final Firestore _fireStore = Firestore.instance;

  @override
  _ListViewExState createState() => _ListViewExState();
}

class _ListViewExState extends State<ListViewEx> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget._fireStore.collection('languages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading...');
          }
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                String itemTitle = snapshot.data.documents[index]['name'];
                return CardItem(itemTitle);
              });
        });
  }
}

class CardItem extends StatefulWidget {
  final String itemTitle;

  CardItem(this.itemTitle);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.itemTitle),
      ),
    );
  }
}
