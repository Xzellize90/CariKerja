part of 'page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 450,
        height: 270,
        color: Colors.blue[400],
        child: Center(
            child: Container(
          width: 130,
          height: 130,
          color: Colors.blue,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        ) //CirlceAvatar
            ),
      ),
    );
  }
}
