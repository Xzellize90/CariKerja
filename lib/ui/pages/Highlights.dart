part of 'pageC.dart';

class Highlights extends StatefulWidget {
  Highlights({this.joblist});
  final Joblist joblist;

  @override
  _HighlightsState createState() => _HighlightsState();
}

class _HighlightsState extends State<Highlights> {
  var hlcode = TextEditingController();
  String images;
  var ctrlId = TextEditingController();
  bool isLoading = false;
  // ignore: unused_field
  static DocumentReference productdoc;
  @override
  void dispose() {
    hlcode.dispose();
    super.dispose();
  }

  void clearForm() {
    hlcode.clear();
    hlcode.dispose();
  }

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(top: 45),
                    child: Text("Highlights",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'saira',
                            fontSize: 48)),
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: Container(
                    width: 400,
                    height: 400,
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: ListView(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Geser kebawah untuk membaca deskripsi!!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Fitur Highlight ini berfungsi untuk menampilkan iklan lowongan kerja anda di bagian teratas, sehingga dapat meningkatkan kemungkinan mendapatkan pekerja lebih cepat",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Paket Highlight:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "A. Rp. 15.000 untuk 3 hari Highlight",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "B. Rp. 35.000 untuk 7 hari Highlight",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "C. Rp. 55.000 untuk 30 hari Highlight",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Transfer ke BCA (ATP_Customer): 7055529888 A/N SATRIO BUDIHARJO YAURI",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "setelah selesai transfer, jangan lupa untuk mengupload bukti pembayaran",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                imageFile == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            color: Colors.white,
                            child: Text(
                              "Pilih Gambar",
                              style:
                                  TextStyle(fontFamily: 'saira', fontSize: 15),
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
                              style:
                                  TextStyle(fontFamily: 'saira', fontSize: 15),
                            ),
                            onPressed: () async {
                              chooseImage();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          Semantics(
                            child: Image.file(File(imageFile.path), width: 100),
                          )
                        ],
                      ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 2,
                  child: RaisedButton(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 0,
                    ),
                    color: Colors.white,
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(fontFamily: 'saira', fontSize: 30),
                    ),
                    onPressed: () async {
                      ctrlId = TextEditingController(text: widget.joblist.id);
                      // ignore: unrelated_type_equality_checks
                      if (hlcode == "" || imageFile == null) {
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
                        Joblist product = Joblist(ctrlId.text, '', '', '', '',
                            '', '', '', '', hlcode.text, '');
                        bool result = await JobServices.highlightJobList(
                            product, imageFile);
                        if (result == true) {
                          Fluttertoast.showToast(
                            msg: "Highlight request has been sent",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pop(context);
                          Navigator.pop(context);
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
          ],
        ),
      ),
    );
  }
}
