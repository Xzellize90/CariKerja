import 'package:carikerja/ui/pages/pageC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        subtitle: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("joblist")
              .doc(joblist.id)
              .collection("Appliance")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) return CircularProgressIndicator();

            return Text("Waiting = " + snapshot.data.docs.length.toString());
          },
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
            joblist.image ??
                "https://firebasestorage.googleapis.com/v0/b/carikerja-49dd8.appspot.com/o/blankProfile%2Fblank-profile-picture-973460_1280.png?alt=media&token=74f8e1a1-50bc-4158-b3b2-a4d80c9ce2fa",
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
