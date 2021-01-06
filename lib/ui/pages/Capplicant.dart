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
      body: Container(
        child: ListView(
          children: <Widget>[
            Text(
              "APPLICANT",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
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
                        doc.data()['skill'],
                        doc.data()['spendidikan'],
                        doc.data()['ttl'],
                        doc.data()['profileApplicant'],
                      ));
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
