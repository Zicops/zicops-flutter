import 'package:flutter/material.dart';
import 'package:zicops/views/widgets/PrefixInputField.dart';

import '../../../utils/colors.dart';

class OrganizationTabScreen extends StatefulWidget {
  Function() changeTab;
  OrganizationTabScreen(this.changeTab, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrganizationTabScreen();
  }
}

class _OrganizationTabScreen extends State<OrganizationTabScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  prefixInputField(
                      _controller, "assets/images/organization.png", "Organisation"),
                  const SizedBox(height: 12),
                  prefixInputField(_controller, "assets/images/location.png",
                      "Organization Unit"),
                  const SizedBox(height: 12),
                  prefixInputField(_controller, "assets/images/learning_space.png",
                      "Learning Space Role"),
                  const SizedBox(height: 12),
                  prefixInputField(_controller, "assets/images/role.png",
                      "Role in Organization"),
                  const SizedBox(height: 12),
                  prefixInputField(
                      _controller, "assets/images/other_role.png", "Other Role"),
                  const SizedBox(height: 12),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      widget.changeTab();
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [primaryColor, gradientTwo]),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Next'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600,
                              fontSize: 14,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              )))
    ]);
  }
}
