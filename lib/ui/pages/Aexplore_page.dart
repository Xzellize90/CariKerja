part of 'page.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool _folder = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 5, right: 5, top: 0),
            width: 385,
            height: 120,
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: 30),
              duration: Duration(milliseconds: 400),
              width: _folder ? 35 : 300,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.orange,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 16, top: 0),
                    child: !_folder
                        ? TextField(
                            decoration: InputDecoration(
                                hintText: 'search',
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none),
                          )
                        : null,
                  )),
                  Container(
                      child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(_folder ? 32 : 0),
                          topRight: Radius.circular(32),
                          bottomLeft: Radius.circular(_folder ? 32 : 0),
                          bottomRight: Radius.circular(32)),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                      onTap: () {
                        setState(() {
                          _folder = !_folder;
                        });
                      },
                    ),
                  ))
                ],
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
                color: Colors.white),
          ),
          Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 0),
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Job List",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 21,
                      ),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.black)),
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.yellow,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Highlight 1",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'saira')),
                          subtitle: Text(
                            "Company name",
                            style: TextStyle(fontFamily: 'saira', fontSize: 18),
                          ),
                          leading: CircularProfileAvatar(
                            '',
                            child: Image.asset('assets/white.jpeg'),
                            borderColor: Colors.black,
                            borderWidth: 2,
                            elevation: 2,
                            radius: 30,
                          ),
                        )),
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.black)),
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.yellow,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Highlight 1",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'saira')),
                          subtitle: Text(
                            "Company name",
                            style: TextStyle(fontFamily: 'saira', fontSize: 18),
                          ),
                          leading: CircularProfileAvatar(
                            '',
                            child: Image.asset('assets/white.jpeg'),
                            borderColor: Colors.black,
                            borderWidth: 2,
                            elevation: 2,
                            radius: 30,
                          ),
                        )),
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.black)),
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.yellow,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Highlight 1",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'saira')),
                          subtitle: Text(
                            "Company name",
                            style: TextStyle(fontFamily: 'saira', fontSize: 18),
                          ),
                          leading: CircularProfileAvatar(
                            '',
                            child: Image.asset('assets/white.jpeg'),
                            borderColor: Colors.black,
                            borderWidth: 2,
                            elevation: 2,
                            radius: 30,
                          ),
                        )),
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.black)),
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.yellow,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Highlight 1",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'saira')),
                          subtitle: Text(
                            "Company name",
                            style: TextStyle(fontFamily: 'saira', fontSize: 18),
                          ),
                          leading: CircularProfileAvatar(
                            '',
                            child: Image.asset('assets/white.jpeg'),
                            borderColor: Colors.black,
                            borderWidth: 2,
                            elevation: 2,
                            radius: 30,
                          ),
                        )),
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.black)),
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.yellow,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Job 1",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'saira')),
                          subtitle: Text(
                            "Company name",
                            style: TextStyle(fontFamily: 'saira', fontSize: 18),
                          ),
                          leading: CircularProfileAvatar(
                            '',
                            child: Image.asset('assets/white.jpeg'),
                            borderColor: Colors.black,
                            borderWidth: 2,
                            elevation: 2,
                            radius: 30,
                          ),
                        )),
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.black)),
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.yellow,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Job 1",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'saira')),
                          subtitle: Text(
                            "Company name",
                            style: TextStyle(fontFamily: 'saira', fontSize: 18),
                          ),
                          leading: CircularProfileAvatar(
                            '',
                            child: Image.asset('assets/white.jpeg'),
                            borderColor: Colors.black,
                            borderWidth: 2,
                            elevation: 2,
                            radius: 30,
                          ),
                        )),
                    Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.black)),
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.yellow,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Job 1",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'saira')),
                          subtitle: Text(
                            "Company name",
                            style: TextStyle(fontFamily: 'saira', fontSize: 18),
                          ),
                          leading: CircularProfileAvatar(
                            '',
                            child: Image.asset('assets/white.jpeg'),
                            borderColor: Colors.black,
                            borderWidth: 2,
                            elevation: 2,
                            radius: 30,
                          ),
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
