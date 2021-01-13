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
  final ctrlStatus = TextEditingController(text : "Applicant");
  var ctrlGender = "";
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

  bool _ditekan1 = false;
  bool _ditekan2 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Saira'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:  Color(0xFFEEA20F),
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
                      Text("Gender",
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
                                    "Laki - Laki",
                                    style: TextStyle(
                                        fontFamily: 'saira', fontSize: 20),
                                  ),
                                  onPressed: () {
                                    ctrlGender = "";
                                    setState(() {
                                      _ditekan2 = false;
                                      _ditekan1 = !_ditekan1;
                                      ctrlGender = "Laki";
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
                                    "Perempuan",
                                    style: TextStyle(
                                        fontFamily: 'saira', fontSize: 20),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ctrlGender = "";
                                      _ditekan1 = false;
                                      _ditekan2 = !_ditekan2;

                                      ctrlGender = "Perempuan";
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
                    SizedBox(height: 25),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Mohon Untuk Melengkapi Profile Setelah Login, Profile Akan Di Gunakan Untuk CV Anda",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 90),
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
                        if( ctrlEmail.text == "" || 
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
                          String result = await AuthAServices.signUp(ctrlEmail.text, ctrlPassword.text, ctrlName.text, ctrlLokasi.text, ctrlttLahir.text, ctrlGender, ctrlAgama.text, ctrlHobby.text, ctrlSPenddidikan.text, ctrlSkills.text, ctrlPBekerja.text);
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