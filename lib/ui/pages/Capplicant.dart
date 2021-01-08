part of 'pageC.dart';

class Capplicant extends StatefulWidget {
  Capplicant({this.joblist});
  final Joblist joblist;
  @override
  _CapplicantState createState() => _CapplicantState();
}

class _CapplicantState extends State<Capplicant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 45),
            child: Text("APPLICANT",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'saira', fontSize: 48)),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("joblist")
                  .doc(widget.joblist.id)
                  .collection("Appliance")
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
                if (FirebaseFirestore.instance
                        .collection("joblist")
                        .doc(widget.joblist.id)
                        .collection("Appliance")
                        .snapshots() ==
                    null) {
                  return Container(
                    child: Center(
                      child: Text(
                        "Data Tidak Ada",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: 100),
                    child: ListView(
                      children: snapshot.data.docs.map((DocumentSnapshot doc) {
                        return Applicantcard(
                            user: UserA(
                          doc.data()['id'],
                          doc.data()['email'],
                          doc.data()['namaA'],
                          doc.data()['lokasi'],
                          doc.data()['ttlahir'],
                          doc.data()['agama'],
                          doc.data()['hobby'],
                          doc.data()['spendidikan'],
                          doc.data()['skills'],
                          doc.data()['pbekerja'],
                          doc.data()['profileApplicant'],
                        ));
                      }).toList(),
                    ),
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
