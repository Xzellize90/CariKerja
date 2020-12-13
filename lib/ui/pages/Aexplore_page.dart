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
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 5, right: 5, top: 0),
            width: 400,
            height: 120,
            child: Center(
                child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: _folder ? 56 : 200,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                  boxShadow: kElevationToShadow[6]),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: _folder
                        ? TextField(
                            decoration: InputDecoration(
                                hintText: 'search',
                                hintStyle: TextStyle(color: Colors.blue),
                                border: InputBorder.none),
                          )
                        : null,
                  )),
                  AnimatedContainer(
                      duration: Duration(milliseconds: 499),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(_folder ? 32 : 0),
                              topRight: Radius.circular(32),
                              bottomLeft: Radius.circular(_folder ? 32 : 0),
                              bottomRight: Radius.circular(32)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Icon(Icons.search, color: Colors.blue),
                          ),
                        ),
                      ))
                ],
              ),
            )),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 6),
                      blurRadius: 5,
                      spreadRadius: 5)
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
                color: Colors.blue[400]),
          ),
          Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 25, right: 10, top: 20),
                child: ListView(
                  children: <Widget>[
                    Text(
                      "Job List",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    Card(
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Highlight 1",
                              style: TextStyle(fontSize: 20)),
                          subtitle: Text("Company name"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[400],
                          ),
                        )),
                    Card(
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Highlight 1",
                              style: TextStyle(fontSize: 20)),
                          subtitle: Text("Company name"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[400],
                          ),
                        )),
                    Card(
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Highlight 1",
                              style: TextStyle(fontSize: 20)),
                          subtitle: Text("Company name"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[400],
                          ),
                        )),
                    Card(
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Highlight 1",
                              style: TextStyle(fontSize: 20)),
                          subtitle: Text("Company name"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[400],
                          ),
                        )),
                    Card(
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Job 1", style: TextStyle(fontSize: 20)),
                          subtitle: Text("Company name"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[400],
                          ),
                        )),
                    Card(
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Job 1", style: TextStyle(fontSize: 20)),
                          subtitle: Text("Company name"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[400],
                          ),
                        )),
                    Card(
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text("Job 1", style: TextStyle(fontSize: 20)),
                          subtitle: Text("Company name"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue[400],
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
