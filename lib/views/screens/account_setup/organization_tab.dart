import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/views/widgets/PrefixInputField.dart';

import '../../../graphql_api.graphql.dart';
import '../../../main.dart';
import '../../../models/user/user_details_model.dart';
import '../../../models/user/user_org_model.dart';
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
  String userId = '';

  Future orgLoading() async {
    setState(() {
      isloading = true;
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonDetails =
        jsonDecode(sharedPreferences.getString('user')!);
    var user = UserDetailsModel.fromJson(jsonDetails);
    if (jsonDetails.isNotEmpty) {
      setState(() {
        userId = user.id!;
      });
    }
    print(userId);
    final lspResult = await userClient.client()?.execute(
          GetUserLspsQuery(
            variables: GetUserLspsArguments(userId: userId),
          ),
        );
    print('hello lsp');
    print(lspResult?.data?.getUserLsps.toString());
    final orgResuts = await userClient.client()?.execute(
        GetUserOrganizationsQuery(
            variables: GetUserOrganizationsArguments(userId: userId)));
    print(orgResuts?.data?.getUserOrganizations.toString());
    final orgResultsone = await userClient.client()?.execute(
          GetUserOrgDetailsQuery(
            variables: GetUserOrgDetailsArguments(
                userId: userId,
                user_lsp_id: '5ad1d5ef-9f5f-4ce1-b521-45ca7e49cf30'),
          ),
        );
    //print(orgResultsone?.data?.getUserOrgDetails?.organizationRole.toString());
    UserOrganizationModel userOrganizationModel = UserOrganizationModel(
      orgResultsone?.data?.getUserOrgDetails?.userOrganizationId.toString(),
      orgResultsone?.data?.getUserOrgDetails?.userId.toString(),
      orgResultsone?.data?.getUserOrgDetails?.userLspId.toString(),
      orgResultsone?.data?.getUserOrgDetails?.organizationId.toString(),
      orgResultsone?.data?.getUserOrgDetails?.organizationRole.toString(),
      orgResultsone?.data?.getUserOrgDetails?.isActive,
      orgResultsone?.data?.getUserOrgDetails?.employeeId.toString(),
    );

    final orgResults = await userClient.client()?.execute(
          GetUserOrganizationsQuery(
            variables: GetUserOrganizationsArguments(userId: userId),
          ),
        );

    // UserOrganizationModel userOrganizationModel= UserOrganizationModel(
    //   //orgResults?.data?.getUserOrganizations?.u
    // );
    //  print(orgResults?.data?.getUserOrganizations.toString());
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
                  prefixInputField(
                    _focusNodes[0],
                    _controller,
                    "assets/images/organization.png",
                    "Organisation",
                  ),
                  const SizedBox(height: 12),
                  prefixInputField(
                    _focusNodes[1],
                    _controller,
                    "assets/images/location.png",
                    "Organization Unit",
                  ),
                  const SizedBox(height: 12),
                  prefixInputField(
                    _focusNodes[2],
                    _controller,
                    "assets/images/learning_space.png",
                    "Learning Space Role",
                  ),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[3], _controller,
                      "assets/images/role.png", "Role in Organization"),
                  const SizedBox(height: 12),
                  prefixInputField(
                    _focusNodes[4],
                    _controller,
                    "assets/images/other_role.png",
                    "Other Role",
                  ),
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
