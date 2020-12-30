part of 'pageC.dart';

class CompanyJobList extends StatefulWidget {
  @override
  _CompanyJobListState createState() => _CompanyJobListState();
}

class _CompanyJobListState extends State<CompanyJobList> {
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("joblist");

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
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
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
