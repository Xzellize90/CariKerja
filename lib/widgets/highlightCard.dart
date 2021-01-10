//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:carikerja/models/modelsC.dart';
import 'package:carikerja/models/highlight.dart';

//import 'package:carikerja/ui/pages/pageA.dart';
//import 'package:carikerja/services/job_services.dart';

//import 'package:intl/intl.dart';

class HighlightCard extends StatelessWidget {
  final Highlight highlightA;
  HighlightCard({this.highlightA});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Colors.black)),
        color: Colors.yellow,
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          onTap: () {},
          title: Text(highlightA.judul ?? '',
              style: TextStyle(fontSize: 18, fontFamily: 'saira')),
          subtitle: Text(
            highlightA.gaji ?? '',
            style: TextStyle(fontFamily: 'saira', fontSize: 15),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            backgroundImage: NetworkImage(
              highlightA.image ?? '',
              scale: 40,
            ),
          ),
        ));
  }
}
