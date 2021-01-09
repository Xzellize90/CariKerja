part of 'pageC.dart';

class Highlights extends StatefulWidget {
  Highlights({this.joblist});
  final Joblist joblist;

  @override
  _HighlightsState createState() => _HighlightsState();
}

class _HighlightsState extends State<Highlights> {
  var hlcode = TextEditingController();

  var ctrlId = TextEditingController();
  bool isLoading = false;
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 45),
            child: Text("Highlights",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'saira', fontSize: 48)),
          ),
          Container(
            width: 400,
            height: 265,
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
                  "paket Highlight:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "- Rp. 15.000 untuk 3 hari Highlight",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "- Rp. 85.000 untuk 7 hari Highlight",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "- Rp. 85.000 untuk 30 hari Highlight",
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
                  widget.joblist.judul,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Produk anda akan ter-highlight dalam durasi 2 jam setelah email bukti transfer dikirimkan (jam kerja sampai 16:00 WIB),                  segala highlight yang lewat dari jam 16:00 akan mulai di proses di keesokan hari.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'saira',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Highlight Code",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontFamily: 'saira', fontSize: 16, color: Colors.white),
          ),
          TextFormField(
            controller: hlcode,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText:
                    "Masukan Highlight Code anda yang anda tentukan disini",
                hintStyle: TextStyle(fontSize: 14),
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                )),
          ),
          SizedBox(
            height: 11,
          ),
          RaisedButton(
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
              productdoc = await FirebaseFirestore.instance
                  .collection("joblist")
                  .doc(widget.joblist.id)
                  .collection("Highlight")
                  .add({'uid': "", 'code': hlcode.text});

              Fluttertoast.showToast(
                  msg: "Successfull",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ],
      ),
    );
  }
}
