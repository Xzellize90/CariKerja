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
                      child: Container(
                    child: Text("Kiki Sexy",
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'saira', fontSize: 48)),
                  )),
          Container(
          width: double.infinity,
          height: double.infinity,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("joblist")
                .doc(widget.joblist.id)
                .collection("Appliance")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Data Tidak Ada"),
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.only(top: 50),
                  child: ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot doc) {
                      return Applicantcard(
                          user: UserA(
                        doc.data()['id'],
                        doc.data()['agama'],
                        doc.data()['email'],
                        doc.data()['hobby'],
                        doc.data()['lokasi'],
                        doc.data()['namaA'],
                        doc.data()['pbekerja'],
                        doc.data()['skills'],
                        doc.data()['spendidikan'],
                        doc.data()['ttlahir'],
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
