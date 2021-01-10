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
  // ignore: non_constant_identifier_names
  var appliance_id = "";

  static DocumentReference productdoc;

  void getUserUpdate() async {
    FirebaseFirestore.instance
        .collection('joblist')
        .doc(widget.joblist.id)
        .collection('Appliance')
        .doc(widget.user.uid)
        .snapshots()
        .listen((event) {
      appliance_id = event.data()['appliance_id'];
      setState(() {});
    });
  }

  void initState() {
    getUserUpdate();
    super.initState();
  }

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
                          widget.user.profileApplicant ??
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
                    child: Text(widget.user.ttlahir,
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
                          onPressed: () async {
                            ctrlId =
                                TextEditingController(text: widget.user.uid);
                            setState(() {
                              ctrlJudul = "";

                              ctrlJudul = "1";
                            });
                            productdoc = await FirebaseFirestore.instance
                                .collection("accept")
                                .add({
                              'appliance_id': appliance_id,
                              'status': ctrlJudul,
                              'posisi': widget.joblist.judul,
                              'id': '',
                            });
                            if (productdoc.id != null) {
                              FirebaseFirestore.instance
                                  .collection("accept")
                                  .doc(productdoc.id)
                                  .update({
                                'id': productdoc.id,
                              });
                            }
                            Fluttertoast.showToast(
                                msg: "Berhasil Diterima",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => Capplicant()));
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
                            "Reject",
                            style: TextStyle(fontFamily: 'saira', fontSize: 20),
                          ),
                          onPressed: () async {
                            ctrlId =
                                TextEditingController(text: widget.user.uid);
                            setState(() {
                              ctrlJudul = "";

                              ctrlJudul = "0";
                            });
                            productdoc = await FirebaseFirestore.instance
                                .collection("accept")
                                .add({
                              'appliance_id': appliance_id,
                              'status': ctrlJudul,
                              'posisi': widget.joblist.judul,
                              'id': '',
                            });
                            if (productdoc.id != null) {
                              FirebaseFirestore.instance
                                  .collection("accept")
                                  .doc(productdoc.id)
                                  .update({
                                'id': productdoc.id,
                              });
                            }
                            Fluttertoast.showToast(
                                msg: "Berhasil Ditolak",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => Capplicant()));
                          },
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
