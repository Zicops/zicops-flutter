import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zicops/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zicops/views/screens/account_setup/organization_tab.dart';
import 'package:zicops/views/screens/account_setup/personal_tab.dart';
import 'package:zicops/views/screens/account_setup/preferences_tab.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AccountSetupScreen();
  }
}

class _AccountSetupScreen extends State<AccountSetupScreen> {
  bool showErrorP = false;
  String errorMsgP = "";
  int _selectedTab = 0;

  changeTab(){
    setState(() {
      _selectedTab = _selectedTab +1;
    });
  }
  getScreen() {
    switch (_selectedTab) {
      case 0:
        return PersonalTabScreen(changeTab);
      case 1:
        return OrganizationTabScreen();
      case 2:
        return PreferencesTabScreen();
      default:
        return PersonalTabScreen(changeTab);
    }
  }


  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    // _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        body: SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Your Details",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                  child: tab("Personal", 0, _selectedTab),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                  child: tab("Organisation", 1, _selectedTab),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 2;
                    });
                  },
                  child: tab("Preferences", 2, _selectedTab),
                ),
              ],
            ),
            Expanded(child: getScreen(),)
          ]),
    ));
  }
}

Widget tab(tabTitle, index, selectedTab) {
  return Column(
    children: [
      Text(
        tabTitle,
        style: TextStyle(
            color: index == selectedTab ? primaryColor : Colors.white,
            fontSize: 16),
      ),
    ],
  );
}
