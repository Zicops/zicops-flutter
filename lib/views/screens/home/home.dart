// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  var _bottomNavIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // Widget getScreen() {
  //   switch (_bottomNavIndex) {
  //     case 0:
  //       return const SuppDashboardScreen();
  //     case 1:
  //       return const SuppMyCarsScreen();
  //     case 2:
  //       return const SuppDriverScreen();
  //
  //     case 3:
  //       return const SuppRevenueScreen();
  //
  //     case 4:
  //       return const SuppSettingsScreen();
  //
  //     case 5:
  //       return const SuppMoreScreen();
  //
  //     default:
  //       {
  //         return const SuppDashboardScreen();
  //       }
  //   }
  // }

  String getTitle() {
    switch (_bottomNavIndex) {
      case 0:
        return "Dashboard";
      case 1:
        return "My cars";
      case 2:
        return "My Drivers";

      case 3:
        return "Revenue";

      case 4:
        return "Settings";

      case 5:
        return "Support";

      default:
        {
          return "Global Transporter";
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              getTitle(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SafeArea(child: Text("Home")),
        drawer: Drawer(
          child: ListView(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/personal_bg.png",
                    fit: BoxFit.fill,
                    height: 155,
                    width: double.infinity,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(
                        foregroundImage:
                            AssetImage("assets/images/personal+bg.png"),
                        radius: 32,
                      ),
                      Text("Akash Chowdry"),
                      ExpansionTile(
                        title: Text("Accenture"),
                        children: [Text("Saleforce"), Text("SalesForce")],
                      ),
                      // ExpandablePanel(
                      //   header: const Padding(
                      //     padding: EdgeInsets.only(top: 20),
                      //     child: Text(
                      //       "Car Info",
                      //       style: TextStyle(fontSize: 16),
                      //     ),
                      //   ),
                      //   collapsed: Text(""),
                      //   expanded: Text("Expandeddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"),
                      // ),
                    ],
                  )
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: Text("Profile"),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.only(bottom: 8),
          height: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: CurvedNavigationBar(
            backgroundColor: Colors.black,
            buttonBackgroundColor: gradientTwo,
            color: secondaryColor,
            height: 65,
            items: const [
              Icon(Icons.car_repair, size: 30),
              Icon(Icons.people, size: 30),
              Icon(Icons.home, size: 30),
              Icon(Icons.book, size: 30),
              Icon(Icons.calendar_month, size: 30),
            ],
            onTap: (index) => setState(() => _bottomNavIndex = index),
          ),
        ));
  }
}

// CurvedNavigationBar(
// backgroundColor: Colors.black.withOpacity(0.1),
// key: _bottomNavigationKey,
// items: const [
// CurvedNavigationBarItem(
// child: Icon(
// Icons.home,
// size: 30,
// ), label: "Home"),
// CurvedNavigationBarItem(child: Icon(Icons.car_repair, size: 30), label: "My Cars"),
// CurvedNavigationBarItem(
// child: Icon(Icons.monetization_on, size: 30)),
// CurvedNavigationBarItem(child: Icon(Icons.people, size: 30)),
// CurvedNavigationBarItem(child: Icon(Icons.more_horiz, size: 30)),
// CurvedNavigationBarItem(child: Icon(Icons.settings, size: 30)),
// ],
// onTap: (index) => setState(() => _bottomNavIndex = index),
// ));
