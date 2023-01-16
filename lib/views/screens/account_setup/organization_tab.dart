import 'package:flutter/material.dart';
import 'package:zicops/views/widgets/GradientButton.dart';
import 'package:zicops/views/widgets/PrefixInputField.dart';

class OrganizationTabScreen extends StatefulWidget {
  Function() changeTab;
  OrganizationTabScreen(this.changeTab, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrganizationTabScreen();
  }
}

class _OrganizationTabScreen extends State<OrganizationTabScreen> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.removeListener(() {});
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  prefixInputField(_focusNodes[0], _controller1,
                      "assets/images/organization.png", "Organisation"),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[1], _controller2,
                      "assets/images/location.png", "Organization Unit"),
                  const SizedBox(height: 12),
                  prefixInputField(
                      _focusNodes[2],
                      _controller3,
                      "assets/images/learning_space.png",
                      "Learning Space Role"),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[3], _controller4,
                      "assets/images/role.png", "Role in Organization"),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[4], _controller5,
                      "assets/images/other_role.png", "Other Role"),
                  const SizedBox(height: 12),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      widget.changeTab();
                    },
                    child: gradientButton("Next"),
                  ),
                ],
              )))
    ]);
  }
}
