import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/src/screens/follow/follow_srceen.dart';
import 'package:my_app/src/screens/home/home_screen.dart';
import 'package:my_app/src/screens/search/search_screen.dart';

import 'package:my_app/src/screens/menu/menu_screen.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    FollowScreen(),
    const MenuScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildNavIcon(String activeIcon, String inactiveIcon, int index) {
    return SvgPicture.asset(
      _currentIndex == index ? activeIcon : inactiveIcon,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        _currentIndex == index ? Color(0xff03307a) : Colors.black54,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: Colors.black54,
          ),
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              backgroundColor: Colors.black12,
              elevation: 0,
              selectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              selectedItemColor: Color(0xff03307a),
              unselectedItemColor: Colors.black54,
/*              showSelectedLabels: false,
              showUnselectedLabels: false,*/
              items: [
                BottomNavigationBarItem(
                  icon: _buildNavIcon("assets/svg/home.active.svg", "assets/svg/home.inactive.svg", 0),
                  label: 'Trang chủ',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon("assets/svg/search.svg", "assets/svg/search.svg", 1),
                  label: 'Tìm kiếm',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon("assets/svg/follow.active.svg", "assets/svg/follow.inactive.svg", 2),
                  label: 'Theo dõi',
                ),
                BottomNavigationBarItem(
                  icon: _buildNavIcon("assets/svg/menu.active.svg", "assets/svg/menu.inactive.svg", 3),
                  label: 'Menu',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
