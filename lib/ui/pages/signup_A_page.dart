part of 'pageA.dart';

class SignUpApplicant extends StatefulWidget {
  @override
  _SignUpApplicantState createState() => _SignUpApplicantState();
}

class _SignUpApplicantState extends State<SignUpApplicant> {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  final ctrlLokasi = TextEditingController();
  final ctrlttLahir = TextEditingController();
  final ctrlAgama = TextEditingController();
  final ctrlHobby = TextEditingController();
  final ctrlSPenddidikan = TextEditingController();
  final ctrlSkills = TextEditingController();
  final ctrlPBekerja = TextEditingController();
  bool isLoading = false;

  @override
  void dispose(){
    ctrlName.dispose();
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    ctrlLokasi.dispose();
    ctrlttLahir.dispose();
    ctrlAgama.dispose();
    ctrlHobby.dispose();
    ctrlSPenddidikan.dispose();
    ctrlSkills.dispose();
    ctrlPBekerja.dispose();
    super.dispose();
  }

  void clearForm(){
    ctrlName.clear();
    ctrlEmail.clear();
    ctrlPassword.clear();
    ctrlLokasi.clear();
    ctrlttLahir.clear();
    ctrlAgama.clear();
    ctrlHobby.clear();
    ctrlSPenddidikan.clear();
    ctrlSkills.clear();
    ctrlPBekerja.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Saira'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: Stack(
                  children: [Container(
            margin: EdgeInsets.all(18),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 65
                    ),
                    ),
                    SizedBox(height: 25),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Nama Lengkap Anda",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Nama Lengkap Anda",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Lokasi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlLokasi,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Lokasi",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Tempat/Tanggal Lahir",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlttLahir,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Tempat/Tanggal Lahir",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Agama",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlAgama,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Agama",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Hobby",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlHobby,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Hobby",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Sejarah Pendidikan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlSPenddidikan,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Sejarah Pendidikan",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )
                      ),
                      obscureText: false,
                      maxLines: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Skills",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlSkills,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Skills",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )
                      ),
                      obscureText: false,
                      maxLines: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Pengalaman Bekerja",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlPBekerja,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Pengalaman Bekerja",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )
                      ),
                      obscureText: false,
                      maxLines: 8,
                    ),
                    SizedBox(height: 70),
                    RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(50)
                      ),
                      icon: Icon(Icons.file_upload), 
                      label: Text("Register",
                      style: TextStyle(fontSize: 38),
                      ),
                      textColor: Colors.black,
                      color: Colors.white,
                      onPressed: () async{
                        if(ctrlName.text == "" || 
                          ctrlEmail.text == "" || 
                          ctrlPassword.text == ""){
                            Fluttertoast.showToast(
                              msg: "Please fill all fields !",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                        }else{
                          setState(() {
                            isLoading = true;
                          });
                          String result = await AuthAServices.signUp(ctrlEmail.text, ctrlPassword.text, ctrlName.text, ctrlLokasi.text, ctrlttLahir.text, ctrlAgama.text, ctrlHobby.text, ctrlSPenddidikan.text, ctrlSkills.text, ctrlPBekerja.text);
                          if(result=="success"){
                            Fluttertoast.showToast(
                              msg: "Success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            setState(() {
                            isLoading = false;
                            clearForm();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignInApplicant())
                            );
                          });
                          }
                          else{
                            Fluttertoast.showToast(
                              msg: result,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            setState(() {
                            isLoading = false;
                            clearForm();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignInApplicant())
                            );
                          });
                          }
                        }
                      }, 
                    ),
                  ],
                ),
              ],
            ),
          ),
          isLoading== true ?
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            child: SpinKitFadingCircle(
              size: 50,
              color: Colors.blue,
            ),
          )
          :
            Container()
                  ]
        ),
      ),
    );
  }
}