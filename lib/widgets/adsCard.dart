import 'package:carikerja/models/adslist.dart';
import 'package:carikerja/ui/pages/pageA.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdsCard extends StatelessWidget {
  final AdsList ads;
  AdsCard({this.ads});

  @override
  Widget build(BuildContext context) {

    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Card(
      color: Colors.green,
      elevation: 50,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
      margin: EdgeInsetsDirectional.fromSTEB(5, 8, 5, 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AdsDetail(
                      ads: ads,
                    )));
        },
        title: Text(
          ads.name ?? '',
          style: TextStyle( foreground: new Paint()..shader = linearGradient,fontSize: 32),
        ),
        subtitle: Text(ads.description ?? ''),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: NetworkImage(ads.image ?? '',scale: 40),
          radius: 50,
        ),
      ),
    );
  }
}
