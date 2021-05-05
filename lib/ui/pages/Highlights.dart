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
                          "setelah selesai transfer, jangan lupa kirim bukti melalui e-mail kerja kita",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          " advancetechpioneer@gmail.com",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'saira',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Produk anda akan ter-highlight dalam durasi 2 jam setelah email bukti transfer dikirimkan (jam kerja sampai 16:00 WIB), segala highlight yang lewat dari jam 16:00 akan mulai di proses di keesokan hari.",
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
                Flexible(
                  flex: 1,
                  child: Text(
                    "Kode Highlight",
                    style: TextStyle(
                        fontFamily: 'saira', fontSize: 16, color: Colors.white),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: TextFormField(
                    controller: hlcode,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Masukan Kode Highlight",
                        hintStyle: TextStyle(fontSize: 14),
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(images ??
                                "https://firebasestorage.googleapis.com/v0/b/carikerja-49dd8.appspot.com/o/blankProfile%2Fblank-profile-picture-973460_1280.png?alt=media&token=74f8e1a1-50bc-4158-b3b2-a4d80c9ce2fa"),
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
                  child: Text("Unggah Bukti Transaksi",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'saira')),
                )),
                RaisedButton.icon(
                    onPressed: () async {
                      await chooseImage();
                      await HighlightsServices.updateHighlight(
                              FirebaseFirestore.instance
                                  .collection("joblist")
                                  .id,
                              imageFile)
                          .then((value) {
                        if (value) {
                          Fluttertoast.showToast(
                            msg: "Update profile picture succesful!",
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
                    label: Text("Re-choose from gallery")),
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
                      if (hlcode == "") {
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
                        bool result =
                            await JobServices.highlightJobList(product);
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
