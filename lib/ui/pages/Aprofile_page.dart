part of 'pageA.dart';

class ProfileApp extends StatefulWidget {
  ProfileApp({this.user});
  final UserA user;
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
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
      FirebaseFirestore.instance.collection("userA");
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

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      id = event.data()['uid'];
      name = event.data()['namaA'];
      email = event.data()['email'];
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
      body: Container(
        width: 450,
        height: 1000,
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                width: 270,
                height: 170,
              ),
            ),
            SizedBox(height: 10),
            Text("Gambar Profile",
                style: TextStyle(color: Colors.white, fontFamily: 'saira')),
            imageFile == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          chooseImage();
                        },
                        icon: Icon(Icons.image_aspect_ratio),
                        label: Text("Pilih gambar",
                            style: TextStyle(
                              fontFamily: 'saira',
                            )),
                        color: Colors.white,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton.icon(
                          onPressed: () {
                            chooseImage();
                          },
                          icon: Icon(Icons.image_aspect_ratio),
                          label: Text("Rechoose from gallery")),
                    ],
                  ),
            Container(
              width: 400,
              height: 240,
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  Text("Nama Lengkap",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    controller: ctrlName = TextEditingController(text: name),
                    keyboardType: TextInputType.emailAddress,
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
                  Text("Email",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    controller: ctrlEmail = TextEditingController(text: email),
                    keyboardType: TextInputType.emailAddress,
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
                  Text("Lokasi",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                    keyboardType: TextInputType.emailAddress,
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
                    keyboardType: TextInputType.emailAddress,
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
                    keyboardType: TextInputType.emailAddress,
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
                  Text("Riwayat Pendidikan",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: ctrlPend =
                        TextEditingController(text: pendidikan),
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
                  Text("Skills",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: ctrlSkill = TextEditingController(text: skill),
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
                  Text("Pengalaman Bekerja",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: ctrlKerja = TextEditingController(text: kerja),
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
                ],
              ),
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
                          style: TextStyle(fontFamily: 'saira', fontSize: 25),
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
                                ctrlId.text, ctrlName.text, ctrlEmail.text);
                            bool result = await UserAServices.editProduct(user);
                            if (result == true) {
                              Fluttertoast.showToast(
                                msg: "Edit product succesful!",
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
                          style: TextStyle(fontFamily: 'saira', fontSize: 25),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Signout Confirmation"),
                                  content: Text("Are you sure to signout?"),
                                  actions: [
                                    FlatButton(
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await AuthAServices.signout()
                                            .then((value) {
                                          if (value) {
                                            Navigator.pushReplacement(context,
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
            )
          ],
        ),
      ),
    );
  }
}
