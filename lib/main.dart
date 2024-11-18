import 'package:flutter/material.dart';
import 'providers/attendance_provider.dart';
import 'screen/kehadiran_screen.dart';
import 'screen/history.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AttendanceProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Monitoring',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AttendanceApp(),
    );
  }
}

class AttendanceApp extends StatefulWidget {
  @override
  _AttendanceAppState createState() => _AttendanceAppState();
}

class _AttendanceAppState extends State<AttendanceApp> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    AttendanceScreen(),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Pencatatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}