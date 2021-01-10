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
            Text(widget.status.posisi,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 22)),
            Text("Gaji : " + widget.status.gaji,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 17)),
            Text((() {
              if(widget.status.status == "1"){
                return "Di Terima";}

              return "Di Tolak";
            })(),style: TextStyle(color: Colors.black, fontFamily: 'saira', fontSize: 17)),
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
