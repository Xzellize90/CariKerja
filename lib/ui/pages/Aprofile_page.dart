part of 'pageA.dart';

class ProfileApp extends StatefulWidget {
  ProfileApp({this.user});
  final UserA user;
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  bool isLoading;

  TextEditingController controllerEmail;

  TextEditingController controllerName;
  TextEditingController controllerLokasi;
  TextEditingController controllerLahir;
  TextEditingController controllerAgama;
  TextEditingController controllerHobby;
  TextEditingController controllerPend;
  TextEditingController controllerSkill;
  TextEditingController controllerKerja;

  User _auth = FirebaseAuth.instance.currentUser;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("userA");
  String id,
      email,
      name,
      hobby,
      lokai,
      agama,
      pendidikan,
      ttl,
      skill,
      kerja,
      status,
      images;

  var ctrlEmail = TextEditingController();
  var ctrlName = TextEditingController();
  var ctrlLokasi = TextEditingController();
  var ctrlLahir = TextEditingController();
  var ctrlAgama = TextEditingController();
  var ctrlHobby = TextEditingController();
  var ctrlPend = TextEditingController();
  var ctrlSkill = TextEditingController();
  var ctrlKerja = TextEditingController();
  var ctrlStatus = TextEditingController( text: "applicant");

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

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      id = event.data()['uid'];
      email = event.data()['email'];
      images = event.data()['profileApplicant'];
      name = event.data()['namaA'];
      lokai = event.data()['lokasi'];
      ttl = event.data()['ttlahir'];
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
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(images ?? ""),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      width: 270,
                      height: 170,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: Container(
                    child: Text("Gambar Profile",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'saira')),
                  )),
                  RaisedButton.icon(
                      onPressed: () async {
                        await chooseImage();
                        await UserAServices.updateProfileApplicant(
                                _auth.uid, imageFile)
                            .then((value) {
                          if (value) {
                            Fluttertoast.showToast(
                              msg: "Update profile picture succesfull!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Failed",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        });
                      },
                      icon: Icon(Icons.image_aspect_ratio),
                      label: Text("Rechoose from gallery")),
                  Center(
                    child: Text(email ?? '',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'saira',
                            fontSize: 20)),
                  ),
                  SizedBox(height: 10),
                  Text("Nama Lengkap",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    controller: ctrlName = TextEditingController(text: name),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 15),
                        hintText: "Write your email",
                        hintStyle: TextStyle(fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  Text("Lokasi",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    controller: ctrlLokasi = TextEditingController(text: lokai),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 15),
                        hintText: "Write your email",
                        hintStyle: TextStyle(fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  SizedBox(height: 10),
                  Text("Tempat / Tanggal Lahir",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    controller: ctrlLahir = TextEditingController(text: ttl),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 15),
                        hintText: "Write your email",
                        hintStyle: TextStyle(fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  SizedBox(height: 10),
                  Text("Agama",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    controller: ctrlAgama = TextEditingController(text: agama),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 15),
                        hintText: "Write your email",
                        hintStyle: TextStyle(fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  SizedBox(height: 10),
                  Text("Hobby",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    controller: ctrlHobby = TextEditingController(text: hobby),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 15),
                        hintText: "Write your email",
                        hintStyle: TextStyle(fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sejarah Pendidikan",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  TextFormField(
                    controller: ctrlPend =
                        TextEditingController(text: pendidikan),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Sejarah Pendidikan",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    obscureText: false,
                    maxLines: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Skills",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  TextFormField(
                    controller: ctrlSkill = TextEditingController(text: skill),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Skills",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    obscureText: false,
                    maxLines: 8,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pengalaman Bekerja",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  TextFormField(
                    controller: ctrlKerja = TextEditingController(text: kerja),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Pengalaman Bekerja",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    obscureText: false,
                    maxLines: 8,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: Center(
                        child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: RaisedButton(
                              color: Colors.white,
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    fontFamily: 'saira', fontSize: 25),
                              ),
                              onPressed: () async {
                                ctrlId = TextEditingController(text: id);
                                if (ctrlName.text == "") {
                                  Fluttertoast.showToast(
                                    msg: "Please fill all fields!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                } else {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  UserA user = UserA(
                                      ctrlId.text,
                                      ctrlEmail.text,
                                      ctrlName.text,
                                      ctrlLokasi.text,
                                      ctrlLahir.text,
                                      ctrlAgama.text,
                                      ctrlHobby.text,
                                      ctrlPend.text,
                                      ctrlSkill.text,
                                      ctrlKerja.text,
                                      "");
                                  bool result =
                                      await UserAServices.editApplicant(user);
                                  if (result == true) {
                                    Fluttertoast.showToast(
                                      msg: "Edit succesful!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                    setState(() {
                                      isLoading = false;
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "Failed! Try again",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: RaisedButton(
                              color: Colors.red,
                              child: Text(
                                "Sign Out",
                                style: TextStyle(
                                    fontFamily: 'saira', fontSize: 25),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Signout Confirmation"),
                                        content:
                                            Text("Are you sure to signout?"),
                                        actions: [
                                          FlatButton(
                                            onPressed: () async {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              await AuthAServices.signout()
                                                  .then((value) {
                                                if (value) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return SignInApplicant();
                                                  }));
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                }
                                              });
                                            },
                                            child: Text("Yes"),
                                          ),
                                          FlatButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
        isLoading == true
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
                child: SpinKitFadingCircle(
                  size: 50,
                  color: Colors.blue,
                ),
              )
            : Container()
      ]),
    );
  }
}
