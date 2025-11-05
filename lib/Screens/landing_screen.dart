
import 'package:anime/Screens/categories_screen.dart';
import 'package:anime/Screens/home_screen.dart';
import 'package:anime/Screens/profile_screen.dart';
import 'package:anime/Screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../api_helper/queries.dart';
import '../models/Animemodel.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;
  final _destination = const [
    NavigationDestination(
        icon: Icon(Icons.home_outlined, color: Color(0xFF424242),),
        selectedIcon: Icon(Icons.home),
        label: ''
    ),
    NavigationDestination(
        icon: Icon(Icons.category_outlined, color: Color(0xFF424242),),
        selectedIcon: Icon(Icons.category),
        label: ''
    ),
    NavigationDestination(
        icon: Icon(Icons.search_outlined, color: Color(0xFF424242),),
        selectedIcon: Icon(Icons.search),
        label: ''
    ),
    NavigationDestination(
        icon: Icon(Icons.person_2_outlined, color: Color(0xFF424242),),
        selectedIcon: Icon(Icons.person_2),
        label: ''
    )
  ];
  final _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
            indicatorShape: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFF424242),
                    width: 2
                )
            ),

          backgroundColor: Color(0xFFEBEBEB)
        ),
        child: NavigationBar(
            destinations: _destination,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: _currentPageIndex,
            onDestinationSelected: (index){
              setState(() {
                _currentPageIndex=index;
              });
            },
        ),
      ),
      body: _screens[_currentPageIndex],

    );
  }
}





