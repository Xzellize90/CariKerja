part of 'pageC.dart';

class SignUpCompany extends StatefulWidget {
  @override
  _SignUpCompanyState createState() => _SignUpCompanyState();
}

class _SignUpCompanyState extends State<SignUpCompany> {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  final ctrlLokasi = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    ctrlName.dispose();
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    ctrlLokasi.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlName.clear();
    ctrlEmail.clear();
    ctrlPassword.clear();
    ctrlLokasi.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Saira'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEEA20F),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.all(18),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 65),
                    ),
                    SizedBox(height: 25),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama Perusahaan",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlName,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nama Perusahaan anda yang sedang jalan",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Tolong masukan email anda yang aktif",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText:
                              "Masukan Password yang mudah anda ingat (Minimal 6 characters)",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Lokasi",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    TextFormField(
                      controller: ctrlLokasi,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Lokasi",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                    ),
                    SizedBox(height: 70),
                    RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      icon: Icon(Icons.file_upload),
                      label: Text(
                        "Register",
                        style: TextStyle(fontSize: 38),
                      ),
                      textColor: Colors.black,
                      color: Colors.white,
                      onPressed: () async {
                        if (ctrlName.text == "" ||
                            ctrlEmail.text == "" ||
                            ctrlPassword.text == "" ||
                            ctrlLokasi.text == "") {
                          Fluttertoast.showToast(
                            msg: "Please fill all fields !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else if (ctrlPassword.text.characters.length <= 5) {
                          Fluttertoast.showToast(
                            msg: "Password minimal 6 character",
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
                          String result = await AuthCServices.signUp(
                              ctrlEmail.text,
                              ctrlPassword.text,
                              ctrlName.text,
                              ctrlLokasi.text);
                          await AuthCServices.addUserC(
                            ctrlEmail.text,
                            ctrlPassword.text,
                          );
                          if (result == "success") {
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInCompany()));
                            });
                          } else {
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInCompany()));
                              clearForm();
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
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(
                    size: 50,
                    color: Colors.blue,
                  ),
                )
              : Container()
        ]),
      ),
    );
  }
}
