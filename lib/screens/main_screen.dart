import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import 'package:fakestore/screens/home.dart';
import 'package:fakestore/screens/notification.dart';
import 'package:fakestore/screens/profile.dart';
import 'package:fakestore/screens/search.dart';

import 'package:fakestore/providers/navigation.dart';

import 'package:fakestore/services/snackbar.dart';

class MainScreen extends StatelessWidget {
  final _pages = [
    HomeScreen(),
    SearchScreen(),
    null,
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _pages[navigationProvider.currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SnackBarService().showSnackBar("Not implemented Yet");
        },
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationProvider.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => navigationProvider.setIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(
              IconlyBold.home,
              color: Theme.of(context).colorScheme.secondary,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.search),
            activeIcon: Icon(
              IconlyBold.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: 50.0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.notification),
            activeIcon: Icon(
              IconlyBold.notification,
              color: Theme.of(context).colorScheme.secondary,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            activeIcon: Icon(
              IconlyBold.profile,
              color: Theme.of(context).colorScheme.secondary,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
