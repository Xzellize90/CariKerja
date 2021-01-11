part of 'pageA.dart';

class ResultA extends StatefulWidget {
  final Status status;
  ResultA({this.status});
  @override
  _ResultAState createState() => _ResultAState();
}

class _ResultAState extends State<ResultA> {
  TextEditingController controllerName;
  TextEditingController controllerPrice;

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
    print(widget.status.status);
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
                        image: NetworkImage(widget.status.image ??
                            "https://firebasestorage.googleapis.com/v0/b/carikerja-49dd8.appspot.com/o/blankProfile%2Fblank-profile-picture-973460_1280.png?alt=media&token=74f8e1a1-50bc-4158-b3b2-a4d80c9ce2fa"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                width: 310,
                height: 220,
              ),
            ),
            SizedBox(height: 10),
            Text(widget.status.posisi,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 22)),
            Text(NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp').format(int.parse(widget.status.gaji))+" Per Bulan"),
            Text((() {
              if (widget.status.status == "1") {
                return "Di Terima";
              } else if (widget.status.status == "0") {
                return "Di Tolak";
              }
            })(),
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 17)),
            Container(
              width: 400,
              height: 300,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: [
                  Text(
                    widget.status.deskripsi,
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  Text(
                    "Contact untuk info lebih lanjut : ",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  Text(
                    widget.status.kontak,
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  Text(
                    "Note : Mohon hubungi email atau nomor telfon dalam durasi maksimal 2 * 24 jam ",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
