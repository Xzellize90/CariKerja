import 'package:flutter/material.dart';
import 'package:carikerja/models/modelsC.dart';
import 'package:carikerja/ui/pages/pageA.dart';

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
          title: Text(joblist.judul ?? '',
              style: TextStyle(fontSize: 18, fontFamily: 'saira')),
          subtitle: Text(
            joblist.gaji ?? '',
            style: TextStyle(fontFamily: 'saira', fontSize: 15),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            backgroundImage: NetworkImage(
              joblist.image ?? '',
              scale: 40,
            ),
          ),
        ));
  }
}
