//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carikerja/models/modelsC.dart';
import 'package:carikerja/ui/pages/pageA.dart';
import 'package:carikerja/services/job_services.dart';

import 'package:intl/intl.dart';

class JoblistCardA extends StatelessWidget {
  final Joblist joblist;
  JoblistCardA({this.joblist});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Colors.black)),
        color: Colors.yellow,
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => JobA(
                      joblist: joblist,
                    )));
          },
          title: Text(joblist.judul,
              style: TextStyle(fontSize: 18, fontFamily: 'saira')),
          subtitle: Text(
            "Gaji : " +
                NumberFormat.currency(
                        locale: 'id', decimalDigits: 0, symbol: 'Rp')
                    .format(int.parse(joblist.gaji)),
            style: TextStyle(fontFamily: 'saira', fontSize: 15),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            backgroundImage: NetworkImage(
              joblist.image,
              scale: 40,
            ),
          ),
        ));
  }
}
