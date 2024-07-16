import 'package:flutter/material.dart';
import 'package:medical_client_side/features/home/screens/home_screen.dart';
import 'package:medical_client_side/features/home/screens/notifications_screen.dart';
import 'package:medical_client_side/features/home/screens/settings_screen.dart';

class HomeMainScreen extends StatefulWidget {
  static const String routeName = '/home-main';
  const HomeMainScreen({super.key});

  @override
  HomeMainScreenState createState() => HomeMainScreenState();
}

class HomeMainScreenState extends State<HomeMainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Large screen layout
            return Row(
              children: [
                NavigationRail(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: _onItemTapped,
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    NavigationRailDestination(
                      icon: const Icon(HomeScreen.inactifIcon),
                      selectedIcon: const Icon(HomeScreen.actifIcon),
                      label: Text(HomeScreen.routeName.substring(1)),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.notifications_outlined),
                      selectedIcon: Icon(Icons.notifications),
                      label: Text('Notifications'),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    children: const [
                      HomeScreen(),
                      NotificationsScreen(),
                      SettingsScreen(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            // Small screen layout
            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: const [
                HomeScreen(),
                NotificationsScreen(),
                SettingsScreen(),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  activeIcon: const Icon(HomeScreen.actifIcon),
                  icon: const Icon(HomeScreen.inactifIcon),
                  label: HomeScreen.routeName.substring(1),
                ),
                const BottomNavigationBarItem(
                  activeIcon: Icon(Icons.notifications),
                  icon: Icon(Icons.notifications_outlined),
                  label: 'Notifications',
                ),
                const BottomNavigationBarItem(
                  activeIcon: Icon(Icons.settings),
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            );
          } else {
            return const SizedBox.shrink(); // Empty widget when screen is large
          }
        },
      ),
    );
  }
}
