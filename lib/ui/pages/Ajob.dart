part of 'pageA.dart';

class JobA extends StatefulWidget {
  JobA({this.joblist});
  final Joblist joblist;
  @override
  _JobAState createState() => _JobAState();
}

class _JobAState extends State<JobA> {
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("joblist");
  User _auth = FirebaseAuth.instance.currentUser;

  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("userA");

  static DocumentReference productDoc;

  String id,
      email,
      name,
      hobby,
      lokai,
      agama,
      kerja,
      pendidikan,
      ttlahir,
      skill,
      images;

  void getUserUpdate() async {
    productCollection.doc(_auth.uid).snapshots().listen((event) {
      id = event.data()['uid'];
      email = event.data()['email'];
      images = event.data()['profileApplicant'];
      name = event.data()['namaA'];
      lokai = event.data()['lokasi'];
      ttlahir = event.data()['ttlahir'];
      agama = event.data()['agama'];
      hobby = event.data()['hobby'];
      pendidikan = event.data()['spendidikan'];
      skill = event.data()['skills'];
      kerja = event.data()['pbekerja'];

      setState(() {});
    });
  }

  void initState() {
    getUserUpdate();
    super.initState();
  }

  var ctrlName = TextEditingController();
  var ctrlPrice = TextEditingController();
  var ctrlId = TextEditingController();

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();
  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Container(
        width: 450,
        height: 1000,
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.joblist.image ?? ""),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                width: 270,
                height: 170,
              ),
            ),
            SizedBox(height: 10),
            Text(widget.joblist.judul ?? '',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 22)),
            Text(widget.joblist.gaji ?? '',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 17)),
            Text(widget.joblist.penempatan ?? '',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 17)),
            Container(
              width: 400,
              height: 200,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: [
                  Text(
                    widget.joblist.deskripsi ?? '',
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Contact untuk info lebih lanjut : ",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  Text(
                    widget.joblist.kontak ?? '',
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 90,
              child: Center(
                  child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: RaisedButton(
                        padding: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 0,
                        ),
                        color: Colors.white,
                        child: Text(
                          "Apply",
                          style: TextStyle(fontFamily: 'saira', fontSize: 30),
                        ),
                        onPressed: () async {
                          if (name == null ||
                              agama == null ||
                              email == null ||
                              hobby == null ||
                              lokai == null ||
                              kerja == null ||
                              skill == null ||
                              pendidikan == null ||
                              ttlahir == null) {
                            Fluttertoast.showToast(
                                msg: "Mohon lengkapi profil",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            ctrlId =
                                TextEditingController(text: widget.joblist.id);
                            productDoc = await FirebaseFirestore.instance
                                .collection("joblist")
                                .doc(widget.joblist.id)
                                .collection("Appliance")
                                .add({
                              'appliance_id':
                                  FirebaseAuth.instance.currentUser.uid,
                              'agama': agama ?? '',
                              'email': email ?? '',
                              'hobby': hobby ?? '',
                              'lokasi': lokai ?? '',
                              'namaA': name ?? '',
                              'pbekerja': kerja ?? '',
                              'skill': skill ?? '',
                              'spendidikan': pendidikan ?? '',
                              'ttlahir': ttlahir ?? '',
                              'uid': productDoc.id ?? '',
                            });
                            Fluttertoast.showToast(
                                msg: "Successfull",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MainMenu();
                            }));
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
