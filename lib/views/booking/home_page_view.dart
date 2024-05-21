import 'package:dofy/constants/theme.dart';
import 'package:dofy/views/screens.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    BookingPageView(),
    Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Text('Recherche Ticket Page'),
      ),
    ),
    Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Text('Settings Page'),
      ),
    ),
  ];

  final Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Tickets': Icons.confirmation_num_rounded,
    'Settings': Icons.settings,
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        items: _icons
            .map(
              (title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  icon: Icon(
                    icon,
                    size: 30.0,
                  ),
                  label: title,
                ),
              ),
            )
            .values
            .toList(),
        currentIndex: _selectedIndex,
        selectedFontSize: 11.0,
        selectedItemColor: Colors.deepPurple[500],
        unselectedItemColor: Colors.black45,
        onTap: _onItemTapped,
      ),
    );
  }
}
