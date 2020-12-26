part of 'pageA.dart';

class NotifPage extends StatefulWidget {
  @override
  _NotifPageState createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Container(
        child: Column(
          children: [
            Flexible(
                flex: 15,
                child: Container(
                  height: 3000,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 0),
                  child: ListView(
                    children: <Widget>[
                      Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Posisi 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Status : Diterima",
                              style:
                                  TextStyle(fontFamily: 'saira', fontSize: 15),
                            ),
                            leading: CircularProfileAvatar(
                              '',
                              child: Image.asset('assets/white.jpeg'),
                              borderColor: Colors.black,
                              borderWidth: 2,
                              elevation: 2,
                              radius: 25,
                            ),
                          )),
                      Container(
                        height: 82,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 2, color: Colors.black)),
                            color: Colors.yellow,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 10),
                              title: Text("Posisi 1",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'saira')),
                              subtitle: Text(
                                "Status: Ditolak",
                                style: TextStyle(
                                    fontFamily: 'saira', fontSize: 15),
                              ),
                              leading: CircularProfileAvatar(
                                '',
                                child: Image.asset('assets/white.jpeg'),
                                borderColor: Colors.black,
                                borderWidth: 2,
                                elevation: 2,
                                radius: 25,
                              ),
                            )),
                      ),
                      Container(
                        height: 82,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 2, color: Colors.black)),
                            color: Colors.yellow,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 10),
                              title: Text("Posisi 1",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'saira')),
                              subtitle: Text(
                                "Status: Ditolak",
                                style: TextStyle(
                                    fontFamily: 'saira', fontSize: 15),
                              ),
                              leading: CircularProfileAvatar(
                                '',
                                child: Image.asset('assets/white.jpeg'),
                                borderColor: Colors.black,
                                borderWidth: 2,
                                elevation: 2,
                                radius: 25,
                              ),
                            )),
                      ),
                      Container(
                        height: 82,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 2, color: Colors.black)),
                            color: Colors.yellow,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 10),
                              title: Text("Posisi 1",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'saira')),
                              subtitle: Text(
                                "Status: Ditolak",
                                style: TextStyle(
                                    fontFamily: 'saira', fontSize: 15),
                              ),
                              leading: CircularProfileAvatar(
                                '',
                                child: Image.asset('assets/white.jpeg'),
                                borderColor: Colors.black,
                                borderWidth: 2,
                                elevation: 2,
                                radius: 25,
                              ),
                            )),
                      ),
                      Container(
                        height: 82,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 2, color: Colors.black)),
                            color: Colors.yellow,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 10),
                              title: Text("Posisi 1",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'saira')),
                              subtitle: Text(
                                "Status: Ditolak",
                                style: TextStyle(
                                    fontFamily: 'saira', fontSize: 15),
                              ),
                              leading: CircularProfileAvatar(
                                '',
                                child: Image.asset('assets/white.jpeg'),
                                borderColor: Colors.black,
                                borderWidth: 2,
                                elevation: 2,
                                radius: 25,
                              ),
                            )),
                      ),
                    ],
                  ),
                )),
            Flexible(
                flex: 3,
                child: Container(
                  width: 325,
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/white.jpeg"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/white.jpeg"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/white.jpeg"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/white.jpeg"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
