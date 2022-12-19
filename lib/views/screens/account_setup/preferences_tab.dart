import 'package:flutter/material.dart';
import 'package:zicops/views/screens/account_setup/models/category.dart';

import '../../../utils/colors.dart';

class PreferencesTabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PreferencesTabScreen();
  }
}

class _PreferencesTabScreen extends State<PreferencesTabScreen> {
  List<Category> categories = [
    Category(0, "Finance & Accounting", null),
    Category(1, "Design", null),
    Category(2, "Technology", null),
    Category(3, "Architecture", null),
    Category(4, "Project Management", null),
    Category(5, "Soft Skills", null),
    Category(6, "Language", null)
  ];
  List<Category> subCategories = [
    Category(50, "UX Design", 1),
    Category(51, "Graphics Design", 1),
    Category(52, "Mobile Design", 1),
    Category(53, "App Design", 1),
    Category(54, "Interactive Design", 1),
  ];
  List<int> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        child: Text("Hello World"),
      ),
        body: Column(children: [
      Wrap(
        children: [
          ...categories.map(
            (cat) => GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    color: secondaryColor,
                    child: Text(
                      cat.category,
                      style: const TextStyle(fontSize: 14, color: textPrimary),
                    ))),
          ),
        ],
      ),
    ]));
  }
}
