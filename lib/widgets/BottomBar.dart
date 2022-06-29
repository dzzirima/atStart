import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_time_tracker/constants/GlobalVariables.dart';
import 'package:intern_time_tracker/screens/WorkingHoursActions.dart';
import 'package:intern_time_tracker/screens/workingHours.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWith = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const WorkingHours(),
    const WorkingHoursActions(),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Intern Time Tracker")),
        backgroundColor: GlobalVariables.selectedNavBarColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        //called whenever there is a tap in one of the icons
        onTap: updatePage,
        items: [
          //HOME
          BottomNavigationBarItem(
            label: "My Activity",
            icon: Container(
              width: bottomBarWith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.access_time_filled_outlined),
            ),
          ),
          //ACCOUNT / PROFILE
          BottomNavigationBarItem(
            label: "Actions",
            icon: Container(
              width: bottomBarWith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.analytics_outlined),
            ),
          ),

          //CART TAB
        ],
      ),
    );
  }
}
