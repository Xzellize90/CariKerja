import 'package:carikerja/models/modelsA.dart';
import 'package:carikerja/models/modelsC.dart';
import 'package:carikerja/ui/pages/pageC.dart';
import 'package:flutter/material.dart';

class Applicantcard extends StatelessWidget {
  final UserA user;
  final Joblist joblist;
  Applicantcard({this.user, this.joblist});

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
                builder: (context) => Csv(
                      user: user,
                      joblist: joblist,
                    )));
          },
          title: Text(user.namaA ?? '',
              style: TextStyle(fontSize: 18, fontFamily: 'saira')),
          subtitle: Text(
            user.lokasi ?? '',
            style: TextStyle(fontFamily: 'saira', fontSize: 15),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            backgroundImage: NetworkImage(
              user.profileApplicant ??
                  "https://firebasestorage.googleapis.com/v0/b/carikerja-49dd8.appspot.com/o/blankProfile%2Fblank-profile-picture-973460_1280.png?alt=media&token=74f8e1a1-50bc-4158-b3b2-a4d80c9ce2fa",
              scale: 40,
            ),
          ),
        ));
  }
}
