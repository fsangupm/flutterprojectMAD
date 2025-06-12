import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/second_screen.dart';
import 'screens/third_screen.dart';
import 'screens/shared_preferences_screen.dart';
import 'screens/gps_tracker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    SplashScreen(),
    GpsTrackerScreen(),
    SecondScreen(),
    ThirdScreen(),
    SharedPreferencesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Splash',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Tracker'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Third',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vpn_key),
            label: 'API Key',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
