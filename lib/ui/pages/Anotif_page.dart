part of 'pageA.dart';

class NotifPage extends StatefulWidget {
  final Status status;
  NotifPage({this.status, this.user});

  final UserA user;
  @override
  _NotifPageState createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  CollectionReference statusCol =
      FirebaseFirestore.instance.collection("status");

  User _auth = FirebaseAuth.instance.currentUser;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("userA");
  String id, email, name;

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      id = event.data()['uid'];
      name = event.data()['namaA'];
      setState(() {});
    });
  }

  void initState() {
    getUserUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("accept")
                  .where("appliance_id", isEqualTo: id)
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
                if (snapshot.data.docs.length == 0) {
                  return Container(
                    child: Center(
                      child: Text("Data Tidak Ada",
                          style: TextStyle(fontFamily: 'saira')),
                    ),
                  );
                } else {
                  return ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot doc) {
                      return Astatus(
                          status: Status(
                        doc.data()['appliance_id'],
                        doc.data()['id'],
                        doc.data()['posisi'],
                        doc.data()['posisi'],
                        doc.data()['status'],
                        doc.data()['posisi'],
                        doc.data()['posisi'],
                        doc.data()['posisi'],
                      ));
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
