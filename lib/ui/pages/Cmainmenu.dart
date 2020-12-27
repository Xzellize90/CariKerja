part of 'pageC.dart';

class CompanyMain extends StatefulWidget {
  @override
  _CompanyMainState createState() => _CompanyMainState();
}

class _CompanyMainState extends State<CompanyMain> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    CompanyAdd(),
    NotifPage(),
    ProfileApp()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("Explore"),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text("Notification"),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text("My Profile"),
              backgroundColor: Colors.orange)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}