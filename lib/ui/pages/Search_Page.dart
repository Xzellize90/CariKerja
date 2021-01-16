part of 'pageA.dart';

class SPage extends StatefulWidget {
  String ctrlSearch;
  SPage({this.ctrlSearch});

  @override
  _SPageState createState() => _SPageState(ctrlSearch: ctrlSearch);
}

class _SPageState extends State<SPage> {
  String ctrlSearch;
  _SPageState({this.ctrlSearch});

  final uid = FirebaseAuth.instance.currentUser.uid;

  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("joblist");

  bool _folder = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Color(0xFFEEA20F),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 7),
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
                        .where("judul", isEqualTo: ctrlSearch)
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
                                  doc.data()['code']));
                        }).toList(),
                      );
                    },
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
