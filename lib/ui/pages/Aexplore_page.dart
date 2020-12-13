part of 'page.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 5, right: 5, top: 0),
            width: 400,
            height: 150,
            child: Center(
              child: Text(
                "Hello,, Hakiki :)",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
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
          Flexible(flex:1 , child: Container(
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
                      title:
                          Text("Highlight 1", style: TextStyle(fontSize: 20)),
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
                      title:
                          Text("Highlight 1", style: TextStyle(fontSize: 20)),
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
                      title:
                          Text("Highlight 1", style: TextStyle(fontSize: 20)),
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
                      title:
                          Text("Highlight 1", style: TextStyle(fontSize: 20)),
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
