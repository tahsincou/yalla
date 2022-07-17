import 'package:flutter/material.dart';
import 'package:yalla/blocks/screens/dashboard/dashboard.dart';
import 'package:yalla/blocks/screens/matches/all_matches.dart';
import 'package:yalla/blocks/screens/matches/who_liked.dart';
import 'package:yalla/blocks/screens/profile/my_profile.dart';


class NavigationBarCommon extends StatefulWidget {
  const NavigationBarCommon({Key? key}) : super(key: key);

  @override
  State<NavigationBarCommon> createState() => _NavigationBarCommonState();
}

class _NavigationBarCommonState extends State<NavigationBarCommon> {
  int index = 0;
  final screens = [
    const DashBoardScreen(),
    const AllMatchesScreen(),
     const WhoLikedMeScreen(),
    const MyProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            height: 60,
            backgroundColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).scaffoldBackgroundColor,
            labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor))),
        child: NavigationBar(
          selectedIndex: index,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.search_outlined,
                    color: Theme.of(context).scaffoldBackgroundColor),
                selectedIcon: Icon(Icons.search),
                label: 'Discover'),
            NavigationDestination(
                icon: Icon(Icons.supervisor_account_outlined,
                    color: Theme.of(context).scaffoldBackgroundColor),
                selectedIcon:const  Icon(Icons.supervisor_account),
                label: 'Matches'),
            NavigationDestination(
                icon: Icon(Icons.thumb_up_alt_outlined,
                    color: Theme.of(context).scaffoldBackgroundColor),
                selectedIcon: Icon(Icons.thumb_up),
                label: 'likes'),
            NavigationDestination(
                icon: Icon(Icons.account_box_outlined,
                    color: Theme.of(context).scaffoldBackgroundColor),
                selectedIcon: Icon(Icons.account_box),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
