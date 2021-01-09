part of 'pageC.dart';

class DetailJob extends StatefulWidget {
  DetailJob({this.joblist});
  final Joblist joblist;
  @override
  _DetailJobState createState() => _DetailJobState();
}

class _DetailJobState extends State<DetailJob> {
  bool isLoading = false;
  TextEditingController controllerName;
  TextEditingController controllerGaji;
  TextEditingController controllerDesc;
  TextEditingController controllerKontak;
  TextEditingController controllerPenempatan;

  var ctrlName = TextEditingController();
  var ctrlkontak = TextEditingController();
  var ctrlPenempatan = TextEditingController();

  var ctrlGaji = TextEditingController();
  var ctrlDesc = TextEditingController();

  var ctrlId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Stack(
        children: [
          Container(
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(widget.joblist.image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            width: 270,
                            height: 270,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                child: Container(
                                    child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 30,
                                            child: TextFormField(
                                              controller: ctrlName =
                                                  TextEditingController(
                                                      text:
                                                          widget.joblist.judul),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      new EdgeInsets.symmetric(
                                                          vertical: 5,
                                                          horizontal: 5.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  labelStyle:
                                                      TextStyle(fontSize: 15),
                                                  hintText: "Write your email",
                                                  hintStyle:
                                                      TextStyle(fontSize: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0))),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            width: 170,
                                            height: 30,
                                            child: TextFormField(
                                              controller: ctrlGaji =
                                                  TextEditingController(
                                                      text:
                                                          widget.joblist.gaji),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(5),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  labelStyle:
                                                      TextStyle(fontSize: 15),
                                                  hintText: "Write your email",
                                                  hintStyle:
                                                      TextStyle(fontSize: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: RaisedButton(
                                          color: Colors.white,
                                          child: Text(
                                            "Applicant",
                                            style: TextStyle(
                                                fontFamily: 'saira',
                                                fontSize: 35),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Capplicant(
                                                          joblist:
                                                              widget.joblist,
                                                        )));
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "Penempatan : " + widget.joblist.penempatan,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'saira')),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: ctrlDesc = TextEditingController(
                              text: widget.joblist.deskripsi),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Sejarah Pendidikan",
                              hintStyle: TextStyle(fontSize: 18),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 40.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          obscureText: false,
                          maxLines: 8,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Center(
                      child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                              child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: RaisedButton(
                                      color: Colors.white,
                                      child: Text(
                                        "Update",
                                        style: TextStyle(
                                            fontFamily: 'saira', fontSize: 35),
                                      ),
                                      onPressed: () async {
                                        ctrlId = TextEditingController(
                                            text: widget.joblist.id);
                                        if (ctrlName.text == "" ||
                                            ctrlGaji.text == "" ||
                                            ctrlDesc.text == "") {
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
                                          Joblist product = Joblist(
                                            ctrlId.text,
                                            ctrlName.text,
                                            ctrlDesc.text,
                                            '',
                                            ctrlGaji.text,
                                            '',
                                            "",
                                            '',
                                          );
                                          bool result =
                                              await JobServices.editJoblist(
                                                  product);
                                          if (result == true) {
                                            Fluttertoast.showToast(
                                              msg: "Update Product Succesful!",
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
                                          borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                      ))),
                                ),
                                Container(
                                    width: 85,
                                    height: 85,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Highlights(
                                                        joblist:
                                                            widget.joblist)));
                                      },
                                      child: Text('Highlight',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'saira',
                                              fontSize: 14)),
                                    )),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: RaisedButton(
                                    color: Colors.white,
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontFamily: 'saira', fontSize: 35),
                                    ),
                                    onPressed: () {
                                      ctrlId = TextEditingController(
                                          text: widget.joblist.id);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Confirmation"),
                                              content: Text(
                                                  "Are you sure want to delete?"),
                                              actions: [
                                                FlatButton(
                                                  child: Text("Yes"),
                                                  onPressed: () async {
                                                    setState(() {
                                                      isLoading = true;
                                                    });
                                                    Joblist joblist = Joblist(
                                                        ctrlId.text,
                                                        "",
                                                        "",
                                                        "",
                                                        "",
                                                        "",
                                                        "",
                                                        "");
                                                    bool result =
                                                        await JobServices
                                                            .deleteJoblist(
                                                                joblist);
                                                    if (result == true) {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "Delete product succesful!",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        backgroundColor:
                                                            Colors.green,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0,
                                                      );
                                                      setState(
                                                        () {
                                                          isLoading = false;
                                                        },
                                                      );

                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text("no"),
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          )),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(height: 10),
                ],
              ),
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
        ],
      ),
    );
  }
}
