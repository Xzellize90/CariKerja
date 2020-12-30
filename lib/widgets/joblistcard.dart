import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carikerja/models/modelsC.dart';
import 'package:carikerja/ui/pages/pageC.dart';
import 'package:carikerja/services/servicesC.dart';

class JoblistCard extends StatelessWidget {
  User _auth = FirebaseAuth.instance.currentUser;
  final UserC userC;
  final Joblist joblist;
  JoblistCard({this.joblist, this.userC});

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("userC");
  String id, email, name, lokai, images;

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      id = event.data()['uid'];
      email = event.data()['email'];
      images = event.data()['CompanyProfileApplicant'];
      name = event.data()['namaC'];
      lokai = event.data()['lokasi'];
    });
  }

  void initState() {
    getUserUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 20),
        onTap: () {},
        title: Text(joblist.judul, style: TextStyle(fontFamily: 'saira')),
        subtitle: Text(
          "Waiting :",
          style: TextStyle(fontFamily: 'saira'),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
            joblist.image,
            scale: 40,
          ),
        ),
        trailing: Text(
          name ?? 'bye',
          style: TextStyle(fontFamily: 'saira'),
        ),
      ),
    );
  }
}
