import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/blocs/account_setup/account_setup_bloc.dart';
import 'package:zicops/repositories/account_setup_repository.dart';
import 'package:zicops/views/screens/account_setup/primary_subcategory.dart';

import '../../../utils/colors.dart';
import '../../widgets/spacer_line.dart';
import '../account_setup/models/category.dart';
import '../account_setup/preferences_tab.dart';

List<Category> subCategories = [
  Category(50, "UX Design", '1'),
  Category(51, "Graphics Design", '1'),
  Category(52, "Mobile Design", '1'),
  Category(53, "App Design", '1'),
  Category(54, "Technology Design", '2'),
  Category(55, "Technology UX", '2'),
  Category(56, " Architecture Design", '3'),
  Category(57, "English", '6'),
  Category(58, "German", '6'),
  Category(59, "French", '6'),
];

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PreferencesScreen();
  }
}

class _PreferencesScreen extends State<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AccountSetupBloc(AccountSetupRepository())
        ..add(SelectedPreferenceRequested()),
      child: BlocBuilder<AccountSetupBloc, AccountSetupState>(
        builder: (context, state) {
          print(state);
          if (state is SelectedPreferenceLoaded) {
            return Scaffold(
              backgroundColor: secondaryColor,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(48.sp),
                child: AppBar(
                  backgroundColor: secondaryColor,
                  elevation: 0,
                  leading: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 4.sp,
                            top: 16.sp,
                            bottom: 16.sp,
                            left: 20.sp),
                        child: Image.asset(
                          "assets/images/back_arrow.png",
                          height: 16.sp,
                          width: 16.sp,
                        ),
                      )),
                  leadingWidth: 40.sp,
                  title: SizedBox(
                    height: 24.sp,
                    child: Text("Preferences",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: textPrimary)),
                  ),
                ),
              ),
              body: ListView(
                children: [
                  Container(
                      height: 24.sp,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Language".toUpperCase(),
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: textGrey2,
                            letterSpacing: 1),
                      )),
                  Container(
                    height: 48.sp,
                    margin: EdgeInsets.symmetric(horizontal: 20.sp),
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Base language",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: textPrimary,
                          ),
                        ),
                        Text(
                          "English",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: textGrey2,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  SpacerLine(width, 1.sp, EdgeInsets.zero),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Container(
                      height: 24.sp,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "primary Subcategory".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: textGrey2,
                                  letterSpacing: 1),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PrimarySubCategoryScreen(
                                                  subCategories, [])));
                                },
                                child: Container(
                                  width: 24.sp,
                                  height: 24.sp,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/images/edit_pen.png",
                                    width: 18.sp,
                                    height: 18.sp,
                                    color: textGrey2,
                                  ),
                                ))
                          ])),
                  Container(
                    height: 48.sp,
                    margin: EdgeInsets.symmetric(horizontal: 20.sp),
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.baseCategory,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  SpacerLine(width, 1.sp, EdgeInsets.zero),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Container(
                      height: 24.sp,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "all Subcategories".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: textGrey2,
                                  letterSpacing: 1),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PreferencesTabScreen(
                                                isEdit: true,
                                              )));
                                },
                                child: Container(
                                  width: 24.sp,
                                  height: 24.sp,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/images/edit_pen.png",
                                    width: 18.sp,
                                    height: 18.sp,
                                    color: textGrey2,
                                  ),
                                ))
                          ])),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.sp),
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...state.selectedSubCategories.map((e) => Container(
                            height: 48.sp,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e!,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: textPrimary,
                              ),
                            )))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  SpacerLine(width, 1.sp, EdgeInsets.zero),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
