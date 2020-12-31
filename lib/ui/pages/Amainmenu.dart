part of 'pageA.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
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
              label: ("Explore"),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: ("Notification"),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: ("My Profile"),
              backgroundColor: Colors.orange)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
