part of 'pageC.dart';

class CompanyProfileApp extends StatefulWidget {
  CompanyProfileApp({this.user});
  final UserC user;
  @override
  _CompanyProfileAppState createState() => _CompanyProfileAppState();
}

class _CompanyProfileAppState extends State<CompanyProfileApp> {
  bool isLoading;

  User _auth = FirebaseAuth.instance.currentUser;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("userC");
  String id, email, name, lokai, images;

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
      images = event.data()['profileCompany'];
      name = event.data()['namaC'];
      lokai = event.data()['lokasi'];

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
                              image: NetworkImage(images ??
                                  "https://i.pinimg.com/originals/54/95/41/549541f8cf16e4a9e6d822c9819a6c84.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.greenAccent),
                      width: 250,
                      height: 250,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: Container(
                    child: Text("Gambar Profile",
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'saira')),
                  )),
                  RaisedButton.icon(
                      onPressed: () async {
                        await chooseImage();
                        await UserCServices.updateProfileCompany(
                                _auth.uid, imageFile)
                            .then((value) {
                          if (value) {
                            Fluttertoast.showToast(
                              msg: "Update profile picture succesfull!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.black,
                              fontSize: 16.0,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Failed",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.black,
                              fontSize: 16.0,
                            );
                          }
                        });
                      },
                      icon: Icon(Icons.image_aspect_ratio),
                      label: Text("Rechoose from gallery")),
                  Center(
                    child: Text(name ?? '',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'saira',
                            fontSize: 25)),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: Container(
                    child: Text(email ?? '',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'saira',
                            fontSize: 22)),
                  )),
                  SizedBox(height: 10),
                  Center(
                      child: Container(
                    child: Text(lokai ?? '',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'saira',
                            fontSize: 22)),
                  )),
                  SizedBox(height: 20),
                  Container(
                    width: 500,
                    height: 80,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text(
                            "Sign Out",
                            style: TextStyle(fontFamily: 'saira', fontSize: 30),
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
                                          await AuthCServices.signout()
                                              .then((value) {
                                            if (value) {
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return SignInCompany();
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
                      ),
                    ),
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
