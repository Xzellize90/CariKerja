part of 'pageC.dart';

class CompanyAdd extends StatefulWidget {
  @override
  _CompanyAddState createState() => _CompanyAddState();
}

class _CompanyAddState extends State<CompanyAdd> {
  bool isLoading = false;

  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerLokasi;
  TextEditingController controllerLahir;
  TextEditingController controllerAgama;
  TextEditingController controllerHobby;
  TextEditingController controllerPend;
  TextEditingController controllerSkill;
  TextEditingController controllerKerja;

  var ctrlJudul = TextEditingController();
  var ctrlDeskripsi = TextEditingController();
  var ctrlKontak = TextEditingController();
  var ctrlGaji = TextEditingController();
  var ctrlPenempatan = "";

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();
  bool _ditekan1 = false;
  bool _ditekan2 = false;
  bool _ditekan3 = false;

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  void clearForm() {
    ctrlJudul.clear();
    ctrlDeskripsi.clear();
    ctrlKontak.clear();
    ctrlGaji.clear();
    _ditekan1 = false;
    _ditekan2 = false;
    _ditekan3 = false;
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Container(
        width: 450,
        height: 1000,
        child: Stack(children: [
          Column(
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
                        controller: ctrlJudul,
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
                        controller: ctrlDeskripsi,
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
                        controller: ctrlKontak,
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
                        controller: ctrlGaji,
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
                                  color:
                                      _ditekan1 ? Colors.orange : Colors.white,
                                  child: Text(
                                    "Lapangan",
                                    style: TextStyle(
                                        fontFamily: 'saira', fontSize: 20),
                                  ),
                                  onPressed: () {
                                    ctrlPenempatan = "";
                                    setState(() {
                                      _ditekan2 = false;
                                      _ditekan3 = false;
                                      _ditekan1 = !_ditekan1;
                                      ctrlPenempatan = "Lapangan";
                                    });
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
                                  color:
                                      _ditekan2 ? Colors.orange : Colors.white,
                                  child: Text(
                                    "Kantor",
                                    style: TextStyle(
                                        fontFamily: 'saira', fontSize: 20),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ctrlPenempatan = "";
                                      _ditekan1 = false;
                                      _ditekan3 = false;
                                      _ditekan2 = !_ditekan2;

                                      ctrlPenempatan = "Kantor";
                                    });
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
                                  color:
                                      _ditekan3 ? Colors.orange : Colors.white,
                                  child: Text(
                                    "Rumah",
                                    style: TextStyle(
                                        fontFamily: 'saira', fontSize: 20),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ctrlPenempatan = "";
                                      _ditekan1 = false;
                                      _ditekan2 = false;
                                      _ditekan3 = !_ditekan3;
                                      ctrlPenempatan = "Rumah";
                                    });
                                  },
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
                      imageFile == null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RaisedButton(
                                  color: Colors.white,
                                  child: Text(
                                    "Pilih Gambar",
                                    style: TextStyle(
                                        fontFamily: 'saira', fontSize: 15),
                                  ),
                                  onPressed: () async {
                                    chooseImage();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Text("File not found"),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RaisedButton(
                                  color: Colors.white,
                                  child: Text(
                                    "Pilih Gambar",
                                    style: TextStyle(
                                        fontFamily: 'saira', fontSize: 15),
                                  ),
                                  onPressed: () async {
                                    chooseImage();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Semantics(
                                  child: Image.file(File(imageFile.path),
                                      width: 100),
                                )
                              ],
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
                              style:
                                  TextStyle(fontFamily: 'saira', fontSize: 25),
                            ),
                            onPressed: () async {
                              if (ctrlJudul.text == "" ||
                                  ctrlDeskripsi.text == "" ||
                                  ctrlKontak.text == "" ||
                                  ctrlGaji.text == "" ||
                                  ctrlPenempatan == "" ||
                                  imageFile == null) {
                                Fluttertoast.showToast(
                                  msg:
                                      "tolong isi semua bagian yang belum terisi",
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
                                Joblist joblist = Joblist(
                                  '',
                                  ctrlJudul.text,
                                  ctrlDeskripsi.text,
                                  ctrlKontak.text,
                                  ctrlGaji.text,
                                  ctrlPenempatan,
                                  '',
                                  '',
                                  '',
                                  '',
                                );
                                bool result = await JobServices.addjoblist(
                                    joblist, imageFile);
                                if (result == true) {
                                  Fluttertoast.showToast(
                                    msg: "Add job succesful!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  clearForm();
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
                      ],
                    ),
                  )),
                ),
              )
            ],
          ),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(size: 50, color: Colors.blue),
                )
              : Container(),
        ]),
      ),
    );
  }
}
