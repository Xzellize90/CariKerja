import 'package:carikerja/ui/pages/pageC.dart';
import 'package:flutter/material.dart';
import 'package:carikerja/models/modelsC.dart';
//import 'package:carikerja/ui/pages/pageC.dart';
//import 'package:carikerja/ui/pages/pageA.dart';

//import 'package:carikerja/services/servicesC.dart';

// ignore: must_be_immutable
class JoblistCard extends StatelessWidget {
  final Joblist joblist;
  JoblistCard({this.joblist});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 20),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailJob(joblist: joblist)));
        },
        title: Text(joblist.judul ?? '', style: TextStyle(fontFamily: 'saira')),
        subtitle: Text(
          "Waiting :",
          style: TextStyle(fontFamily: 'saira'),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
            joblist.image ?? '',
            scale: 40,
          ),
        ),
        trailing: Text(
          'bye',
          style: TextStyle(fontFamily: 'saira'),
        ),
      ),
    );
  }
}
