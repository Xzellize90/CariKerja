import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:carikerja/ui/pages/pageA.dart';
import 'package:carikerja/ui/pages/pageC.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      backgroundColor: Colors.white,
      image: Image.asset('assets/Double Ring-1s-200px.gif'),
      loaderColor: Colors.white,
      photoSize: 150.0,
      navigateAfterSeconds: Opening(),
    );
  }
}

class Opening extends StatefulWidget {
  @override
  _OpeningState createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Saira'),
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: double.infinity,
                  height:double.infinity,
                  child: ListView(
                    children: <Widget>[
                      Text(
                    "CARI",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "KERJA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
            )),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                width: double.infinity,
                  height:double.infinity,
                  child: ListView(
                    children: <Widget>[
                      Text(
                    "Siapa Anda ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
            )),
            Flexible(
              flex: 0,
              child: RaisedButton(
                child: Text('PEKERJA'
                ,style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                ),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
                ),
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInApplicant())
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Flexible(
              flex: 1,
              child: RaisedButton(
                child: Text('PERUSAHAAN'
                ,style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                ),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInCompany())
                  );
                },
              ),
            ),
            ]
          )
        ),
      )
    );
  }
}