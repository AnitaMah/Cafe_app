import 'package:flutter/material.dart';

import 'screens/events_screen.dart';
import 'screens/home_screen.dart';
import 'screens/info_screen.dart';
import 'screens/location_screen.dart';
import 'screens/menu_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const NaomisApp());
}

class NaomisApp extends StatelessWidget {
  const NaomisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Naomi's Coffee Club",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const RootNav(),
    );
  }
}

class RootNav extends StatefulWidget {
  const RootNav({super.key});

  @override
  State<RootNav> createState() => _RootNavState();
}

class _RootNavState extends State<RootNav> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = [
    HomeScreen(onNavigate: _onTap),
    const MenuScreen(),
    const EventsScreen(),
    const LocationScreen(),
    const InfoScreen(),
  ];

  static const _destinations = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Menu'),
    BottomNavigationBarItem(icon: Icon(Icons.event_outlined), label: 'Events'),
    BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: 'Location'),
    BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'Info'),
  ];

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NAOMI'S COFFEE CLUB")),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: _destinations,
      ),
    );
  }
}
