part of 'pageC.dart';

class CompanyJobList extends StatefulWidget {
  @override
  _CompanyJobListState createState() => _CompanyJobListState();
}

class _CompanyJobListState extends State<CompanyJobList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //DocumentReference jobRef = FirebaseFirestorellection('joblist').document({});
  final id = AuthCServices().getCurrentUID();

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
            child: StreamBuilder(
              stream: getUsersPastTripsStreamSnapshots(context),
              builder: (context, snapshot) {
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

                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot doc){
                    return JoblistCard(
                        joblist: Joblist(
                            doc.data()['id'],
                            doc.data()['judul'],
                            doc.data()['deskripsi'],
                            doc.data()['kontak'],
                            doc.data()['gaji'],
                            doc.data()['penempatan'],
                            doc.data()['image']));
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
