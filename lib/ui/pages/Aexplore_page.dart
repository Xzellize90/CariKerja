part of 'pageA.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool _folder = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 5, right: 5, top: 0),
            width: 385,
            height: 120,
            child: Column(
              children: [
                Container(
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(top: 30),
                    duration: Duration(milliseconds: 400),
                    width: 300,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.orange,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(left: 16, top: 13),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'search',
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none),
                          ),
                        )),
                        Container(
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(_folder ? 32 : 0),
                                topRight: Radius.circular(32),
                                bottomLeft: Radius.circular(_folder ? 32 : 0),
                                bottomRight: Radius.circular(32),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: RaisedButton(
                                    color: Colors.brown,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    onPressed: () {},
                                    child: Text("Cari",
                                        style: TextStyle(color: Colors.white)),
                                  )),
                              onTap: () {
                                setState(() {
                                  _folder = !_folder;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 45, top: 5),
                      child: Flexible(
                          flex: 3,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.orange,
                              onPressed: () {},
                              child: Text(
                                "Penempatan",
                                style: TextStyle(color: Colors.white),
                              ))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 75, top: 5),
                      child: Flexible(
                          flex: 3,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.orange,
                              onPressed: () {},
                              child: Text(
                                "Urutkan Gaji",
                                style: TextStyle(color: Colors.white),
                              ))),
                    )
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
                color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            child: Text(
              "Highlist List",
              style: TextStyle(
                fontFamily: 'saira',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Container(
                height: 200,
                margin: EdgeInsets.only(left: 25, right: 25, top: 0),
                child: ListView(
                  children: <Widget>[
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.black)),
                        color: Colors.yellow,
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 10),
                          title: Text("Highlight 1",
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'saira')),
                          subtitle: Text(
                            "Company name",
                            style: TextStyle(fontFamily: 'saira', fontSize: 15),
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
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Highlight 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                    Container(
                      height: 82,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Highlight 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                    Container(
                      height: 82,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Highlight 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Text(
              "Job List",
              style: TextStyle(
                fontFamily: 'saira',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 0),
                height: 200,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 82,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Job 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                    Container(
                      height: 82,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Job 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                    Container(
                      height: 82,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Job 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                    Container(
                      height: 82,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Job 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                    Container(
                      height: 82,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Job 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                    Container(
                      height: 82,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                          color: Colors.yellow,
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            title: Text("Job 1",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            subtitle: Text(
                              "Company name",
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
                    ),
                  ],
                ),
              )),
          Flexible(
              flex: 2,
              child: Container(
                width: 325,
                height: 150,
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
    );
  }
}
