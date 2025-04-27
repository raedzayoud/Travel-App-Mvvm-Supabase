import 'package:flutter/material.dart';
import 'package:travel/constant.dart';
import 'package:travel/feature/home/presentation/view/home.dart';
import 'package:travel/feature/map/presentation/view/map.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  int _page = 0;

  List<Widget> pages = [
    Home(),
    Maps(),
    Text("Search"),
    Text("Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_page],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active_outlined),
              label: 'Buckets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _page,
          selectedItemColor: KPrimayColor,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            onPageChanged(index);
          },
        ));
  }
}
