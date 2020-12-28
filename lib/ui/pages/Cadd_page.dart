part of 'pageC.dart';

class CompanyAdd extends StatefulWidget {
  CompanyAdd({this.user});
  final UserC user;
  @override
  _CompanyAddState createState() => _CompanyAddState();
}

class _CompanyAddState extends State<CompanyAdd> {
  bool isLoading;

  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerLokasi;
  TextEditingController controllerLahir;
  TextEditingController controllerAgama;
  TextEditingController controllerHobby;
  TextEditingController controllerPend;
  TextEditingController controllerSkill;
  TextEditingController controllerKerja;

  User _auth = FirebaseAuth.instance.currentUser;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("userC");
  String id, name, email, hobby, lokai, agama, kerja, pendidikan, ttl, skill;

  var ctrlName = TextEditingController();
  var ctrlEmail = TextEditingController();
  var ctrlLokasi = TextEditingController();
  var ctrlLahir = TextEditingController();
  var ctrlAgama = TextEditingController();
  var ctrlHobby = TextEditingController();
  var ctrlPend = TextEditingController();
  var ctrlSkill = TextEditingController();
  var ctrlKerja = TextEditingController();

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

  void initState() {
    super.initState();
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
            SizedBox(height: 10),
            Flexible(
              flex: 8,
              child: Container(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    Text("Judul",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'saira')),
                    TextFormField(
                      controller: ctrlName = TextEditingController(text: name),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 15),
                          hintText: "Tuliskan Judul-mu",
                          hintStyle: TextStyle(fontSize: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    SizedBox(height: 10),
                    Text("Deskripsi dan Persyaratan",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'saira')),
                    TextFormField(
                      maxLines: 5,
                      controller: ctrlEmail =
                          TextEditingController(text: email),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 15),
                          hintText: "Tuliskan Deskripsi mu nak",
                          hintStyle: TextStyle(fontSize: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    SizedBox(height: 10),
                    Text("Contact info",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'saira')),
                    TextFormField(
                      maxLines: 5,
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlLokasi =
                          TextEditingController(text: lokai),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 15),
                          hintText:
                              "Kontak atau nomor yang bisa dihubungi, biar mesra bang :)",
                          hintStyle: TextStyle(fontSize: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    SizedBox(height: 10),
                    Text("Gaji per bulan",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'saira')),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlLahir = TextEditingController(text: ttl),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 15),
                          hintText:
                              "Tulis gaji per bulan untuk ini pekerjaan, tulis yang mahal ya..",
                          hintStyle: TextStyle(fontSize: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    SizedBox(height: 10),
                    Text("Penempatan",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'saira')),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  "Lapangan",
                                  style: TextStyle(
                                      fontFamily: 'saira', fontSize: 20),
                                ),
                                onPressed: () async {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  "Kantor",
                                  style: TextStyle(
                                      fontFamily: 'saira', fontSize: 20),
                                ),
                                onPressed: () async {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  "Rumah",
                                  style: TextStyle(
                                      fontFamily: 'saira', fontSize: 20),
                                ),
                                onPressed: () async {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("Gambar",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'saira')),
                    RaisedButton(
                      color: Colors.white,
                      child: Text(
                        "Pilih Gambar",
                        style: TextStyle(fontFamily: 'saira', fontSize: 15),
                      ),
                      onPressed: () async {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Center(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text(
                            "Add Job",
                            style: TextStyle(fontFamily: 'saira', fontSize: 25),
                          ),
                          onPressed: () async {}, //MBEK
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
