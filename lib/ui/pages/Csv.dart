part of 'pageC.dart';

class Csv extends StatefulWidget {
  Csv({this.user, this.joblist});
  final UserA user;
  final Joblist joblist;

  @override
  _CsvState createState() => _CsvState();
}

class _CsvState extends State<Csv> {
  var ctrlId = TextEditingController();

  var ctrlJudul = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.all(18),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("CV",
                      style: TextStyle(
                          fontFamily: 'saira',
                          color: Colors.white,
                          fontSize: 70)),
                  Center(
                    child: Container(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/startapp-ece15.appspot.com/o/assets%2Fdefault-user-image.png?alt=media&token=9807934a-cf98-4433-9c22-c013e6fc1859",
                        ),
                      ),
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(widget.user.namaA,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'saira',
                            fontSize: 25)),
                  ),
                  Center(
                      child: Container(
                    child: Text(widget.user.email,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'saira',
                            fontSize: 22)),
                  )),
                  Center(
                      child: Container(
                    child: Text(widget.user.lokasi,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'saira',
                            fontSize: 22)),
                  )),
                  Center(
                      child: Container(
                    child: Text("Hobby : " + widget.user.hobby,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'saira',
                            fontSize: 22)),
                  )),
                  Center(
                      child: Container(
                    child: Text(widget.user.agama,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'saira',
                            fontSize: 22)),
                  )),
                ],
              ),
              SizedBox(height: 10),
              Container(
                child: Text("Pendidikan : " + widget.user.spendidikan,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'saira',
                        fontSize: 18)),
              ),
              SizedBox(height: 10),
              Container(
                child: Text("Skill : " + widget.user.spendidikan,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'saira',
                        fontSize: 18)),
              ),
              SizedBox(height: 40),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: RaisedButton(
                          color: Colors.green,
                          child: Text(
                            "Accept",
                            style: TextStyle(fontFamily: 'saira', fontSize: 20),
                          ),
                          onPressed: () {
                            ctrlId =
                                TextEditingController(text: widget.user.uid);
                            setState(() {
                              ctrlJudul = "";

                              ctrlJudul = "Accepted";
                            });
                            FirebaseFirestore.instance
                                .collection("accept")
                                .add({
                              'appliance_id':
                                  FirebaseAuth.instance.currentUser.uid,
                              'Status': ctrlJudul
                            });
                            Fluttertoast.showToast(
                                msg: "Successfull",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text(
                            "Rejected",
                            style: TextStyle(fontFamily: 'saira', fontSize: 20),
                          ),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
