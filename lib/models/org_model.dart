class OrgModel {
  String orgId;
  String orgName;
  String lspName;
  String orgRole;
  String empId;
  String lspRole;

  OrgModel({
    required this.orgId,
    required this.orgName,
    required this.lspName,
    required this.orgRole,
    required this.empId,
    required this.lspRole,
  });

  OrgModel.fromJson(Map<String, dynamic> json)
      : orgId = json['organization_id'],
        orgName = json['organization_name'],
        lspName = json['lsp_name'],
        orgRole = json['organization_role'],
        empId = json['employee_id'],
        lspRole = json['lsp_role'];

  Map<String, dynamic> toJson() => {
        'orgId': orgId,
        'orgName': orgName,
        'lspName': lspName,
        'orgRole': orgRole,
        'empId': empId,
        'lspRole': lspRole,
      };
}
