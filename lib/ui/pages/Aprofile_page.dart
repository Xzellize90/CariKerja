part of 'page.dart';

class ProfileApp extends StatefulWidget {
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
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
                    keyboardType: TextInputType.emailAddress,
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                    keyboardType: TextInputType.emailAddress,
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                    controller: ctrlName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
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
                        onPressed: () {},
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
                        onPressed: () {},
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
