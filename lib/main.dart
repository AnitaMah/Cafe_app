/// Naomi's Coffee Club — companion app entry point.
///
/// Wires up [AppTheme.theme] and mounts [RootNav], the five-tab navigation
/// shell shared by every screen in `lib/screens/`.
library;

import 'package:flutter/material.dart';

import 'screens/events_screen.dart';
import 'screens/home_screen.dart';
import 'screens/info_screen.dart';
import 'screens/location_screen.dart';
import 'screens/menu_screen.dart';
import 'theme/app_theme.dart';

/// Starts the app.
void main() {
  runApp(const NaomisApp());
}

/// Root widget for Naomi's Coffee Club.
///
/// Applies [AppTheme.theme] app-wide and shows [RootNav] as the home screen.
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

/// The app's five-tab shell: Home, Menu, Events, Location, and Info.
///
/// Keeps all five screens alive in an [IndexedStack] so switching tabs
/// doesn't rebuild them or lose scroll position, and owns the
/// [BottomNavigationBar] that drives [_selectedIndex].
class RootNav extends StatefulWidget {
  const RootNav({super.key});

  @override
  State<RootNav> createState() => _RootNavState();
}

class _RootNavState extends State<RootNav> {
  /// Index of the currently visible tab, in the same order as [_screens]
  /// and [_destinations].
  int _selectedIndex = 0;

  /// One instance per tab. [HomeScreen] gets [_onTap] so its "Find us" /
  /// "View menu" shortcuts can jump to another tab directly.
  late final List<Widget> _screens = [
    HomeScreen(onNavigate: _onTap),
    const MenuScreen(),
    const EventsScreen(),
    const LocationScreen(),
    const InfoScreen(),
  ];

  /// Bottom nav bar icon + label for each tab, in the same order as
  /// [_screens].
  static const _destinations = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Menu'),
    BottomNavigationBarItem(icon: Icon(Icons.event_outlined), label: 'Events'),
    BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: 'Location'),
    BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'Info'),
  ];

  /// Switches the visible tab to [index]. Passed to [HomeScreen] as
  /// `onNavigate` and to the [BottomNavigationBar] as `onTap`.
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
