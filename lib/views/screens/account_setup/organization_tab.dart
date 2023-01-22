import 'package:flutter/material.dart';
import 'package:zicops/views/widgets/PrefixInputField.dart';

import '../../../graphql_api.graphql.dart';
import '../../../main.dart';
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
  bool isloading = false;

  Future orgLoading() async {
    setState(() {
      isloading = true;
    });
    final orgResuts =
        await userClient.client()?.execute(GetUserOrganizationsQuery(variables: GetUserOrganizationsArguments(
          userId:'YW5zaGpvc2hpMDYwN0BnbWFpbC5jb20='
        )));
    print(orgResuts?.data?.getUserOrganizations.toString());

  }


  TextEditingController _controller = TextEditingController();
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
      orgLoading();
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
                  const SizedBox(height: 20),
                  prefixInputField(_focusNodes[0], _controller,
                      "assets/images/organization.png", "Organisation"),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[1], _controller,
                      "assets/images/location.png", "Organization Unit"),
                  const SizedBox(height: 12),
                  prefixInputField(
                      _focusNodes[2],
                      _controller,
                      "assets/images/learning_space.png",
                      "Learning Space Role"),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[3], _controller,
                      "assets/images/role.png", "Role in Organization"),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[4], _controller,
                      "assets/images/other_role.png", "Other Role"),
                  const SizedBox(height: 12),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      widget.changeTab();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [primaryColor, gradientTwo]),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'Next'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ],
              )))
    ]);
  }
}
