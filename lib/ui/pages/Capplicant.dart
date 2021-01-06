part of 'pageC.dart';

class Capplicant extends StatefulWidget {
  @override
  _CapplicantState createState() => _CapplicantState();
}

class _CapplicantState extends State<Capplicant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEA20F),
      body: Container(
        child: Text(
          "APPLICANT",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
