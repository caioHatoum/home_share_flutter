import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem(this.uid, this.name, this.neighborhood, this.image, this.description, this.createdAt);

  final String uid;
  final String name;
  final String neighborhood;
  final String image;
  final String description;
  final Timestamp createdAt;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(name),
            subtitle: Text(neighborhood),
            trailing: Icon(Icons.more_vert)
          ),
          Container(
            child: Image.network(image)
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(description)
          ),
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF252DB7),
                width: 1
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5)
              ),
            ),
            child: SizedBox.expand(
              child: Text('Data de Reserva: ' + createdAt.toDate().toString())
            )
          )
        ]
      )
    );
  }
}