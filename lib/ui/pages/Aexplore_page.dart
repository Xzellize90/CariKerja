part of 'pageA.dart';

class ExplorePage extends StatefulWidget {
  final Joblist joblist;
  ExplorePage({this.joblist, this.highlight});

  final Highlight highlight;
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final uid = FirebaseAuth.instance.currentUser.uid;

  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("joblist");

  CollectionReference highlightCollection =
      FirebaseFirestore.instance.collection("highlight");

  bool _folder = true;

  final ctrlSearch = TextEditingController();

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
                            controller: ctrlSearch,
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
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => SPage(
                                                  ctrlSearch:
                                                      ctrlSearch.text)));
                                    },
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
            margin: EdgeInsets.only(bottom: 7),
            child: Text(
              "Highlight Job",
              style: TextStyle(
                fontFamily: 'saira',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                height: double.infinity,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("joblist")
                        .where("highlight", isEqualTo: "1")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Failed to get products data!");
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitFadingCircle(
                          size: 50,
                          color: Colors.blue,
                        );
                      }

                      return ListView(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot doc) {
                          return JoblistCardA(
                              joblist: Joblist(
                                  doc.data()['id'],
                                  doc.data()['judul'],
                                  doc.data()['deskripsi'],
                                  doc.data()['kontak'],
                                  doc.data()['gaji'],
                                  doc.data()['penempatan'],
                                  doc.data()['image'],
                                  doc.data()['owner'],
                                  doc.data()['highlight'],
                                  doc.data()['code'],
                                  doc.data()['imageH']));
                        }).toList(),
                      );
                    },
                  ),
                ),
              )),
          SizedBox(
            height: 10,
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
                margin: EdgeInsets.only(left: 25, right: 25),
                height: double.infinity,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: productCollection.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Failed to get products data!");
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitFadingCircle(
                          size: 50,
                          color: Colors.blue,
                        );
                      }

                      return ListView(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot doc) {
                          return JoblistCardA(
                              joblist: Joblist(
                                  doc.data()['id'],
                                  doc.data()['judul'],
                                  doc.data()['deskripsi'],
                                  doc.data()['kontak'],
                                  doc.data()['gaji'],
                                  doc.data()['penempatan'],
                                  doc.data()['image'],
                                  doc.data()['owner'],
                                  doc.data()['highlight'],
                                  doc.data()['code'],
                                  doc.data()['imageH']));
                        }).toList(),
                      );
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
