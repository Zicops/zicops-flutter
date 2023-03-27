import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/blocs/account_setup/account_setup_bloc.dart';
import 'package:zicops/controllers/mutation_controller.dart';
import 'package:zicops/models/user/org_model.dart';
import 'package:zicops/repositories/account_setup_repository.dart';
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
  bool isloading = true;

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

  List<String> lspIdList = [];
  List<String> orgIdList = [];
  List<String> userLspIdList = [];

  // Future orgLoading() async {
  //   setState(() {
  //     isloading = false;
  //   });
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Map<String, dynamic> jsonDetails =
  //       jsonDecode(sharedPreferences.getString('user')!);
  //   var user = UserDetailsModel.fromJson(jsonDetails);
  //   if (jsonDetails.isNotEmpty) {
  //     setState(() {
  //       userId = user.id!;
  //     });
  //   }
  //
  //   final lspResult = await userClient.client()?.execute(
  //         GetUserLspsQuery(
  //           variables: GetUserLspsArguments(userId: userId),
  //         ),
  //       );
  //
  //   for (int i in lspResult?.data?.getUserLsps?.asMap().keys ?? []) {
  //     userLspId = lspResult?.data?.getUserLsps?[i]?.userLspId;
  //     userLspIdList.add(lspResult?.data?.getUserLsps?[i]?.userLspId ?? '');
  //
  //     lspId = lspResult?.data?.getUserLsps?[i]?.lspId;
  //     lspIdList.add(lspResult?.data?.getUserLsps?[i]?.lspId ?? '');
  //   }
  //
  //   sharedPreferences.setString('userLspId', userLspId!);
  //   sharedPreferences.setString('lspId', lspId!);
  //
  //   final lspDetailsResult = await userClient.client()?.execute(
  //       GetLearningSpaceDetailsQuery(
  //           variables: GetLearningSpaceDetailsArguments(lsp_ids: lspIdList)));
  //
  //   String lspName =
  //       lspDetailsResult?.data?.getLearningSpaceDetails?[0]?.name ?? '';
  //   for (int i
  //       in lspDetailsResult?.data?.getLearningSpaceDetails?.asMap().keys ??
  //           []) {
  //     orgIdList.add(
  //         lspDetailsResult?.data?.getLearningSpaceDetails?[i]?.orgId ?? '');
  //   }
  //   orgId = lspDetailsResult?.data?.getLearningSpaceDetails?[0]?.orgId ?? '';
  //   final orgDetailsResult = await userClient.client()?.execute(
  //       GetOrganizationsQuery(
  //           variables: GetOrganizationsArguments(org_ids: orgIdList)));
  //   String orgName = orgDetailsResult?.data?.getOrganizations?[0]?.name ?? '';
  //
  //   final getUserLspRolesResult = await userClient.client()?.execute(
  //       GetUserLspRolesQuery(
  //           variables: GetUserLspRolesArguments(
  //               user_lsp_ids: userLspIdList, user_id: userId)));
  //
  //   String lspRole =
  //       getUserLspRolesResult?.data?.getUserLspRoles?[0]?.role ?? '';
  //
  //   final getUserOrgDetailsResult = await userClient.client()?.execute(
  //       GetUserOrgDetailsQuery(
  //           variables: GetUserOrgDetailsArguments(
  //               userId: userId, user_lsp_id: userLspId!)));
  //   userOrgId =
  //       getUserOrgDetailsResult?.data?.getUserOrgDetails?.userOrganizationId;
  //
  //   // String? orgName = '';
  //   // String? orgUnit = '';
  //   // String? lspRole = '';
  //   // String? orgRole = '';
  //   // String? empId = '';
  //
  //   setState(() {
  //     _organisationController.text = orgName;
  //     _orgUnitController.text = lspName;
  //     _lspRoleController.text = lspRole;
  //
  //     // sharedPreferences.setString(orgName, orgName);
  //     // sharedPreferences.setString(orgUnit!, lspName);
  //     // sharedPreferences.setString(lspRole!, lspRole);
  //     // sharedPreferences.setString(orgRole!, _roleController.text);
  //     // sharedPreferences.setString(empId!, _employeeIdController.text);
  //   });
  // }

  void setDataToOrgModel() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString('userId') ?? '';
    // print(userId);

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

    // String userOrg = jsonEncode(orgModel);
    // sharedPreferences.setString("userOrg", userOrg);
    // print(sharedPreferences.getString("userOrg"));
  }

  void handleOrgTab() {
    //   setDataToOrgModel();
    print('hi$userId');
    print('hi$orgId');

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

  final TextEditingController _organisationController = TextEditingController();
  final TextEditingController _orgUnitController = TextEditingController();
  final TextEditingController _lspRoleController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();

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
      //orgLoading();
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
    return BlocProvider(
      create: (context) =>
          AccountSetupBloc(AccountSetupRepository())..add(OrgTabRequested()),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: BlocConsumer<AccountSetupBloc, AccountSetupState>(
            listener: (context, state) {
              if (state is OrganisationTabLoaded) {
                _organisationController.text = state.org.orgName;
                _orgUnitController.text = state.org.lspName;
                _lspRoleController.text = state.org.lspRole;
                orgId = state.org.orgId;
                userOrgId = state.org.userOrgId;
                userLspId = state.org.userLspId;
                userId = state.org.userId;
              }
            },
            builder: (context, state) {
              if (state is OrganisationTabLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is OrganisationTabLoaded) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        prefixInputField(
                          _focusNodes[0],
                          _organisationController,
                          "assets/images/organization.png",
                          "Organisation",
                          true,
                        ),
                        const SizedBox(height: 12),
                        prefixInputField(
                          _focusNodes[1],
                          _orgUnitController,
                          "assets/images/location.png",
                          "Organization Unit",
                          true,
                        ),
                        const SizedBox(height: 12),
                        prefixInputField(
                          _focusNodes[2],
                          _lspRoleController,
                          "assets/images/learning_space.png",
                          "Learning Space Role",
                          true,
                        ),
                        const SizedBox(height: 12),
                        prefixInputField(
                          _focusNodes[3],
                          _roleController,
                          "assets/images/role.png",
                          "Role in Organization",
                          true,
                        ),
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
                            // handleOrgTab();
                            if (userOrgId != '') {
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
                            widget.changeTab();
                          },
                          child: gradientButton("Next"),
                        ),
                      ],
                    ));
              }
              return Container();
            },
          ),
        )
      ]),
    );
  }
}
