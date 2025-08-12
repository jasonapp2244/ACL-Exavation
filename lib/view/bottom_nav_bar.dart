import 'package:acl/utils/routes/routes_name.dart';
import 'package:acl/view/homeview.dart';
import 'package:acl/view/manage_trucks.dart';
import 'package:acl/view/setting_view.dart';
import 'package:acl/view/truck_log_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final String? currentRoute;
  final Function(int)? onTabChanged;

  const CustomBottomNavigationBar({
    super.key,
    this.currentRoute,
    this.onTabChanged,
  });

  @override
  State<CustomBottomNavigationBar> createState() => 
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;
  
  // Map of tab indices to route names
  final Map<int, String> _tabRoutes = {
    0: RoutesName.home,
    1: RoutesName.truckLog,  // Make sure this exists in your RoutesName
    2: RoutesName.manageTrucks,  // Make sure this exists in your RoutesName
    3: RoutesName.settings,  // Make sure this exists in your RoutesName
  };

  // Map of route names to tab indices
  final Map<String, int> _routeTabs = {
    RoutesName.home: 0,
    RoutesName.truckLog: 1,
    RoutesName.manageTrucks: 2,
    RoutesName.settings: 3,
  };

  @override
  void initState() {
    super.initState();
    // Set initial index based on current route or default to 0
    _selectedIndex = widget.currentRoute != null 
        ? _routeTabs[widget.currentRoute!] ?? 0 
        : 0;
  }

  void changeTab(int index) {
    if (index == _selectedIndex) return;

    if (widget.onTabChanged != null) {
      widget.onTabChanged!(index);
    } else {
      // Navigate using your existing routing system
      Navigator.pushNamed(context, _tabRoutes[index]!);
    }
    
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ResponsiveNavigationBar(
        backgroundColor: const Color(0xff7E7EFF),
        activeIconColor: const Color(0xff7E7EFF),
        showActiveButtonText: true,
        selectedIndex: _selectedIndex,
        onTabChange: changeTab,
        textStyle: const TextStyle(
          color: Color(0xff7E7EFF),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
            text: 'Home',
            iconPath: 'assets/icons/home.svg',
            backgroundGradient: LinearGradient(
              colors: [Colors.white, Colors.white],
            ),
          ),
          NavigationBarButton(
            text: 'Logs',
            iconPath: 'assets/icons/courses.svg',
            backgroundGradient: LinearGradient(
              colors: [Colors.white, Colors.white],
            ),
          ),
          NavigationBarButton(
            text: 'Trucks',
            iconPath: 'assets/icons/quizzes.svg',
            backgroundGradient: LinearGradient(
              colors: [Colors.white, Colors.white],
            ),
          ),
          NavigationBarButton(
            text: 'Settings',
            iconPath: 'assets/icons/profile.svg',
            backgroundGradient: LinearGradient(
              colors: [Colors.white, Colors.white],
            ),
          ),
        ],
      ),
    );
  }
}