class UserOrganizationModel{

  String? userOrganizationId;
  String? userId;
  String? userLspId;
  String? organizationId;
  String? organizationRole;
  bool? isActive;
  String? employeeId;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  UserOrganizationModel(
      this.userOrganizationId,
      this.userId,
      this.userLspId,
      this.organizationId,
      this.organizationRole,
      this.isActive,
      this.employeeId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      );

  UserOrganizationModel.fromJson(Map<String, dynamic> json)
      : userOrganizationId = json['id'],
        userId = json['user_id'],
        userLspId = json['user_lsp_id'],
        organizationId = json['organization_id'],
        organizationRole = json['organization_role'],
        isActive = json['is_active'],
        employeeId = json['employee_id'],
        createdBy = json['created_by'],
        updatedBy = json['updated_by'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
    'userOrganizationId': userOrganizationId,
    'userId': userId,
    'userLspId': userLspId,
    'organizationId': organizationId,
    'organizationRole': organizationRole,
    'isActive': isActive,
    'employeeId': employeeId,
    'createdBy': createdBy,
    'updatedBy': updatedBy,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };

}

