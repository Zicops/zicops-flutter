// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/graphql_api.graphql.dart';
import 'package:zicops/main.dart';

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

  Future courseLoading() async {
    print('called');
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     final data = sharedPreferences.getString('userData');
     print(data);
    final allLatestCourse = await courseQClient.client()?.execute(LatestCoursesQuery(
        variables: LatestCoursesArguments(
            publish_time:
                (DateTime.now().millisecondsSinceEpoch / 1000).toInt(),
            pageCursor: "",
            pageSize: 1000,
            filters: new CoursesFilters(),
            Direction: ""
            )));

    // print(allLatestCourse?.data?.toJson());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseLoading();
  }

  String getTitle() {
    switch (_bottomNavIndex) {
      case 0:
        return "Self";
      case 1:
        return "Classroom";
      case 2:
        return "Home";

      case 3:
        return "My Course";

      case 4:
        return "Calender";

      default:
        {
          return "Zicops";
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: secondaryColorDark,
            centerTitle: true,
            title: Text(
              getTitle(),
              style: const TextStyle(color: textPrimary),
            ),
          ),
        ),
        body: SafeArea(child: Text("Home")),
        drawer: Drawer(
          backgroundColor: secondaryColor,
          child: ListView(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/personal_bg.png",
                    fit: BoxFit.fill,
                    height: 165,
                    width: double.infinity,
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: const [
                  //     CircleAvatar(
                  //       foregroundImage:
                  //           AssetImage("assets/images/personal_bg.png"),
                  //       radius: 32,
                  //     ),
                  //     Text("Akash Chowdry"),
                  //     ExpansionTile(
                  //       backgroundColor: secondaryColorLight,
                  //       title: Text("Accenture"),
                  //       children: [Text("Saleforce"), Text("SalesForce")],
                  //     ),
                  //   ],
                  // )
                ],
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/person.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/flag.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Events",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/labs.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Labs",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/exams.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Exams",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/heart.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Favourites",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/preference.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Preferences",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/settings.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/about.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "About",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/help.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Help and Feedback",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/logout.png",
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
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
