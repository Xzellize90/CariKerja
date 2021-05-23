part of 'pageA.dart';

class SignInApplicant extends StatefulWidget {
  SignInApplicant({this.userA});
  final UserA userA;
  @override
  _SignInApplicantState createState() => _SignInApplicantState();
}

class _SignInApplicantState extends State<SignInApplicant> {
  final ctrlEmailA = TextEditingController();
  final ctrlPasswordA = TextEditingController();
  bool isLoading = false;
  bool isworking = false;

  @override
  void dispose() {
    ctrlEmailA.dispose();
    ctrlPasswordA.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return Opening();
          }));
        },
        child: MaterialApp(
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
                          SizedBox(height: 30),
                          Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 65),
                          ),
                          SizedBox(height: 200),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: ctrlEmailA,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Email',
                                labelStyle: TextStyle(fontSize: 18),
                                hintText: "Write your email",
                                hintStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: ctrlPasswordA,
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 18),
                                hintText: "Write your Password",
                                hintStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )),
                          ),
                          SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                                text: 'Register Here',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 24),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignUpApplicant();
                                    }));
                                  }),
                          ),
                          SizedBox(height: 20),
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            icon: Icon(Icons.enhanced_encryption),
                            label: Text(
                              "Login",
                              style: TextStyle(fontSize: 38),
                            ),
                            textColor: Colors.black,
                            color: Colors.lightGreen,
                            onPressed: () async {
                              if (ctrlEmailA.text == "" ||
                                  ctrlPasswordA.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please fill all fields !",
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
                                String result = await AuthAServices.signIn(
                                    ctrlEmailA.text, ctrlPasswordA.text);
                                if (result == "no"){
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
                                  });
                                }else {
                                  if(result == "1"){
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MainMenu();
                                  }));
                                  }
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Fluttertoast.showToast(
                                    msg: "Welcome",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  
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
              ])),
        ));
  }
}
