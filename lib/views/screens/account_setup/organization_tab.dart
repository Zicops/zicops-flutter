import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/controllers/mutation_controller.dart';
import 'package:zicops/models/user/org_model.dart';
import 'package:zicops/views/widgets/GradientButton.dart';
import 'package:zicops/views/widgets/PrefixInputField.dart';

import '../../../graphql_api.graphql.dart';
import '../../../main.dart';
import '../../../models/user/user_details_model.dart';

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
  String? userOrgId;
  String? userLspId = '';
  String? lspId = '';
  String? orgId = '';
  String? orgName = '';
  String? orgUnit = '';
  String? lspRole = '';
  String? orgRole = '';
  String? empId = '';

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
    // print(lspResult?.data?.getUserLsps.toString());

    List<String> lspIdList = [];
    List<String> orgIdList = [];
    List<String> userLspIdList = [];

    for (int i in lspResult?.data?.getUserLsps?.asMap().keys ?? []) {
      lspIdList.add(lspResult?.data?.getUserLsps?[i]?.lspId ?? '');
      userLspIdList.add(lspResult?.data?.getUserLsps?[i]?.userLspId ?? '');
      userLspId = lspResult?.data?.getUserLsps?[i]?.userLspId;
      lspId = lspResult?.data?.getUserLsps?[i]?.lspId;
      // print(lspResult?.data?.getUserLsps?[i]?.use);
    }
    sharedPreferences.setString('userLspId', userLspId!);
    sharedPreferences.setString('lspId', lspId!);

    final lspDetailsResult = await userClient.client()?.execute(
        GetLearningSpaceDetailsQuery(
            variables: GetLearningSpaceDetailsArguments(lsp_ids: lspIdList)));

    String lspName =
        lspDetailsResult?.data?.getLearningSpaceDetails?[0]?.name ?? '';
    for (int i
        in lspDetailsResult?.data?.getLearningSpaceDetails?.asMap().keys ??
            []) {
      orgIdList.add(
          lspDetailsResult?.data?.getLearningSpaceDetails?[i]?.orgId ?? '');
    }
    orgId = lspDetailsResult?.data?.getLearningSpaceDetails?[0]?.orgId ?? '';
    final orgDetailsResult = await userClient.client()?.execute(
        GetOrganizationsQuery(
            variables: GetOrganizationsArguments(org_ids: orgIdList)));
    String orgName = orgDetailsResult?.data?.getOrganizations?[0]?.name ?? '';

    final getUserLspRolesResult = await userClient.client()?.execute(
        GetUserLspRolesQuery(
            variables: GetUserLspRolesArguments(
                user_lsp_ids: userLspIdList, user_id: userId)));

    String lspRole =
        getUserLspRolesResult?.data?.getUserLspRoles?[0]?.role ?? '';

    final getUserOrgDetailsResult = await userClient.client()?.execute(
        GetUserOrgDetailsQuery(
            variables: GetUserOrgDetailsArguments(
                userId: userId, user_lsp_id: userLspId!)));
    userOrgId =
        getUserOrgDetailsResult?.data?.getUserOrgDetails?.userOrganizationId;

    // String? orgName = '';
    // String? orgUnit = '';
    // String? lspRole = '';
    // String? orgRole = '';
    // String? empId = '';

    setState(() {
      _organisationController.text = orgName;
      _orgUnitController.text = lspName;
      _lspRoleController.text = lspRole;

      // sharedPreferences.setString(orgName, orgName);
      // sharedPreferences.setString(orgUnit!, lspName);
      // sharedPreferences.setString(lspRole!, lspRole);
      // sharedPreferences.setString(orgRole!, _roleController.text);
      // sharedPreferences.setString(empId!, _employeeIdController.text);
    });
  }

  Future<void> setDataToOrgModel() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    orgName = _organisationController.text;
    orgUnit = _orgUnitController.text;
    lspRole = _lspRoleController.text;
    orgRole = _roleController.text;
    empId = _employeeIdController.text;

    OrgModel orgModel = OrgModel(
      orgName: orgName,
      orgUnit: orgUnit,
      lspRole: lspRole,
      orgRole: orgRole,
      empId: empId,
    );

    String userOrg = jsonEncode(orgModel);
    sharedPreferences.setString("userOrg", userOrg);
    print(sharedPreferences.getString("userOrg"));
  }

  void handleOrgTab() {
    setDataToOrgModel();

    if (userOrgId != null) {
      updateUserOrganizationMap(
        userId,
        orgId!,
        userOrgId!,
        userLspId!,
        _roleController.text,
        _employeeIdController.text,
      );
    } else {
      addUserOrganization(
        userId,
        orgId!,
        userLspId!,
        _roleController.text,
        _employeeIdController.text,
      );
    }
  }

  TextEditingController _organisationController = TextEditingController();
  TextEditingController _orgUnitController = TextEditingController();
  TextEditingController _lspRoleController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _employeeIdController = TextEditingController();

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
                  prefixInputField(_focusNodes[0], _organisationController,
                      "assets/images/organization.png", "Organisation", true),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[1], _orgUnitController,
                      "assets/images/location.png", "Organization Unit", true),
                  const SizedBox(height: 12),
                  prefixInputField(
                    _focusNodes[2],
                    _lspRoleController,
                    "assets/images/learning_space.png",
                    "Learning Space Role",
                    true,
                  ),
                  const SizedBox(height: 12),
                  prefixInputField(_focusNodes[3], _roleController,
                      "assets/images/role.png", "Role in Organization", true),
                  const SizedBox(height: 12),
                  prefixInputField(
                    _focusNodes[4],
                    _employeeIdController,
                    "assets/images/other_role.png",
                    "Employee ID",
                    true,
                  ),
                  const SizedBox(height: 12),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      widget.changeTab();
                      handleOrgTab();
                    },
                    child: gradientButton("Next"),
                  ),
                ],
              )))
    ]);
  }
}
