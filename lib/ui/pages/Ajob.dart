part of 'pageA.dart';

class JobA extends StatefulWidget {
  @override
  _JobAState createState() => _JobAState();
}

class _JobAState extends State<JobA> {
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
            Text("Sekretaris",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 22)),
            Text("Gaji : Rp.6.000.000",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 17)),
            Text("Kantor",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 17)),
            Text("diterima",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'saira', fontSize: 17)),
            Container(
              width: 400,
              height: 200,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: [
                  Text(
                    "         Dicari seorang sekrretaris, 8 jam kerja, mulai jam 8 pagi hingga jam 4 sore, kecuali tanggal merah dan hari sabtu, berlokasi di kantor mall pondok indah Jakarta, Indonesia",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Persyaratan utama adalah berumur max 25 tahun, lulusan SMA keatas, berdomisili di jakarta dan sekitarnya",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Contact untuk info lebih lanjut : ",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  Text(
                    "+6285123296352 ",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  Text(
                    "ZSolution.space@gmail.com ",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                  Text(
                    "Note : Mohon hubungi email atau nomor telfon dalam durasi maksimal 2 * 24 jam ",
                    style: TextStyle(fontFamily: 'saira', fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 90,
              child: Center(
                  child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: RaisedButton(
                        padding: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 0,
                        ),
                        color: Colors.white,
                        child: Text(
                          "Apply",
                          style: TextStyle(fontFamily: 'saira', fontSize: 30),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
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
