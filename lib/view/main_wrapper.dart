import 'package:acl/utils/routes/routes_name.dart';
import 'package:acl/view/homeview.dart';
import 'package:acl/view/manage_trucks.dart';
import 'package:acl/view/setting_view.dart';
import 'package:acl/view/truck_log_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<String> _navRoutes = [
    RoutesName.home,
    RoutesName.truckLog,
    RoutesName.manageTrucks,
    RoutesName.settings,
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    
    setState(() {
      _selectedIndex = index;
    });
    
    Navigator.pushNamed(context, _navRoutes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: GlobalKey(),
        initialRoute: RoutesName.home,
        onGenerateRoute: (settings) {
          // Handle nested navigation if needed
          return MaterialPageRoute(
            builder: (context) => _buildPage(settings.name ?? RoutesName.home),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ResponsiveNavigationBar(
          backgroundColor: const Color(0xff7E7EFF),
          activeIconColor: const Color(0xff7E7EFF),
          showActiveButtonText: true,
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
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
      ),
    );
  }

  Widget _buildPage(String route) {
    switch (route) {
      case RoutesName.home:
        return Homeview();
      case RoutesName.truckLog:
        return TruckLogView();
      case RoutesName.manageTrucks:
        return ManageTrucks();
      case RoutesName.settings:
        return SettingView();
      default:
        return Homeview();
    }
  }
}