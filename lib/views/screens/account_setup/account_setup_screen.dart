import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zicops/utils/colors.dart';
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

  changeTab() {
    setState(() {
      _selectedTab = _selectedTab + 1;
    });
  }

  getScreen() {
    switch (_selectedTab) {
      case 0:
        return PersonalTabScreen(changeTab);
      case 1:
        return OrganizationTabScreen(changeTab);
      case 2:
        return PreferencesTabScreen();
      default:
        return PersonalTabScreen(changeTab);
    }
  }

  getTitle() {
    switch (_selectedTab) {
      case 0:
        return "Enter Your Details";
      case 1:
        return "Enter Organization Details";
      case 2:
        return "Enter Profile Preferences";
      default:
        return "Enter Your Details";
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    // _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: secondaryColorDark,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 14),
                child: Text(
                  getTitle(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              Container(
                color: secondaryColorDark,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SizedBox(
                      child: tab("Personal", 0, _selectedTab),
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: SizedBox(
                      child: tab("Organisation", 1, _selectedTab),
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: SizedBox(
                      child: tab("Preferences", 2, _selectedTab),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: getScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget tab(String tabTitle, int index, int selectedTab) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tabTitle.toUpperCase(),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: index == selectedTab
                ? primaryColor
                : selectedTab > index
                    ? textPrimary
                    : textGrey,
            fontSize: 12,
            letterSpacing: 1,
            fontWeight: FontWeight.w600),
      ),
      Container(
        height: 4,
        margin: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color: index == selectedTab || selectedTab > index
              ? primaryColor
              : textGrey,
        ),
      )
    ],
  );
}
