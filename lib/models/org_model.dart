class OrgModel {
  String userId;
  String userLspId;
  String orgId;
  String orgName;
  String lspName;
  String orgRole;
  String empId;
  String lspRole;
  String userOrgId;

  OrgModel({
    required this.userId,
    required this.userLspId,
    required this.orgId,
    required this.orgName,
    required this.lspName,
    required this.orgRole,
    required this.empId,
    required this.lspRole,
    required this.userOrgId,
  });

  OrgModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        userLspId = json['userLspId'],
        orgId = json['organization_id'],
        orgName = json['organization_name'],
        lspName = json['lsp_name'],
        orgRole = json['organization_role'],
        empId = json['employee_id'],
        lspRole = json['lsp_role'],
        userOrgId = json['user_organization_id'];

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userLspId': userLspId,
        'orgId': orgId,
        'orgName': orgName,
        'lspName': lspName,
        'orgRole': orgRole,
        'empId': empId,
        'lspRole': lspRole,
        'userOrgId': userOrgId,
      };
}
