//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carikerja/ui/pages/pageA.dart';
import 'package:flutter/material.dart';
//import 'package:carikerja/models/modelsC.dart';
import 'package:carikerja/models/modelsA.dart';

//import 'package:carikerja/ui/pages/pageA.dart';
//import 'package:carikerja/services/job_services.dart';

//import 'package:intl/intl.dart';

class Astatus extends StatelessWidget {
  final Status status;
  Astatus({this.status});

  @override
  Widget build(BuildContext context) {
    if (status.status == "1") {
      return Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Colors.black)),
          color: Colors.yellow,
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultA(
                        status: status,
                      )));
            },
            title: Text(status.posisi ?? '',
                style: TextStyle(fontSize: 18, fontFamily: 'saira')),
            subtitle: Text(
              "Anda Diterima",
              style: TextStyle(fontFamily: 'saira', fontSize: 15),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              backgroundImage: NetworkImage(
                status.image ?? '',
                scale: 40,
              ),
            ),
          ));
    } else {
      return Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Colors.black)),
          color: Colors.yellow,
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultA(
                        status: status,
                      )));
            },
            title: Text(status.posisi ?? '',
                style: TextStyle(fontSize: 18, fontFamily: 'saira')),
            subtitle: Text(
              "Anda Ditolak",
              style: TextStyle(fontFamily: 'saira', fontSize: 15),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              backgroundImage: NetworkImage(
                status.image ?? '',
                scale: 40,
              ),
            ),
          ));
    }
  }
}
