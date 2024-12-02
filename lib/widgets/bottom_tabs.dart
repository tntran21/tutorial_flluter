import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  final int activeIndex;
  final void Function(int) onTabChanged;
  const BottomTabs(
      {super.key, this.activeIndex = 0, required this.onTabChanged});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    // Set the initial index to the activeIndex passed in the constructor
    _selectedIndex = widget.activeIndex;
  }

  // This function is called when a tab is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onTabChanged(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
