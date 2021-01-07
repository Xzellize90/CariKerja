part of 'pageC.dart';

class CompanyJobList extends StatefulWidget {
  @override
  _CompanyJobListState createState() => _CompanyJobListState();
}

class _CompanyJobListState extends State<CompanyJobList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //DocumentReference jobRef = FirebaseFirestorellection('joblist').document({});
  var id = AuthCServices().getCurrentUID();

  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("joblist");
  Stream<QuerySnapshot> getUsersPastTripsStreamSnapshots(
      BuildContext context) async* {
    //final uid = await Provider.of(context).auth.getCurrentUID();
    FirebaseFirestore.instance
        .collection('joblist')
        .where('owner', isEqualTo: id);
    print(id);
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
                  .collection("joblist")
                  .where("owner",
                      isEqualTo: FirebaseAuth.instance.currentUser.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                print(context);
                if (snapshot.hasError) {
                  return Text("Failed to get products data!");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SpinKitFadingCircle(
                    size: 50,
                    color: Colors.blue,
                  );
                }
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Data Tidak Ada"),
                    ),
                  );
                } else {
                  return ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot doc) {
                      return JoblistCard(
                          joblist: Joblist(
                        doc.data()['id'],
                        doc.data()['judul'],
                        doc.data()['deskripsi'],
                        doc.data()['kontak'],
                        doc.data()['gaji'],
                        doc.data()['penempatan'],
                        doc.data()['image'],
                        doc.data()['owner'],
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
