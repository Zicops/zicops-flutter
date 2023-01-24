class UserOrganizationModel {
  String? userOrganizationId;
  String? userId;
  String? userLspId;
  String? organizationId;
  String? organizationRole;
  bool? isActive;
  String? employeeId;

  UserOrganizationModel(
    this.userOrganizationId,
    this.userId,
    this.userLspId,
    this.organizationId,
    this.organizationRole,
    this.isActive,
    this.employeeId,
  );

  UserOrganizationModel.fromJson(Map<String, dynamic> json)
      : userOrganizationId = json['id'],
        userId = json['user_id'],
        userLspId = json['user_lsp_id'],
        organizationId = json['organization_id'],
        organizationRole = json['organization_role'],
        isActive = json['is_active'],
        employeeId = json['employee_id'];

  Map<String, dynamic> toJson() => {
        'userOrganizationId': userOrganizationId,
        'userId': userId,
        'userLspId': userLspId,
        'organizationId': organizationId,
        'organizationRole': organizationRole,
        'isActive': isActive,
        'employeeId': employeeId,
      };
}
