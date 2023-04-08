// Models for data from GraphQL queries
class UserLspMap {
  String? userLspId;
  String? userId;
  String? lspId;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  UserLspMap(
      {this.userLspId,
      this.userId,
      this.lspId,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  UserLspMap.fromJson(Map<String, dynamic> json) {
    userLspId = json['user_lsp_id'];
    userId = json['user_id'];
    lspId = json['lsp_id'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_lsp_id'] = this.userLspId;
    data['user_id'] = this.userId;
    data['lsp_id'] = this.lspId;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LspData {
  String? lspId;
  String? orgId;
  String? ouId;
  String? name;
  String? logoUrl;
  String? profileUrl;
  int? noUsers;
  List<String?>? owners;
  bool? isDefault;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;

  LspData(
      {this.lspId,
      this.orgId,
      this.ouId,
      this.name,
      this.logoUrl,
      this.profileUrl,
      this.noUsers,
      this.owners,
      this.isDefault,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  LspData.fromJson(Map<String, dynamic> json) {
    lspId = json['lsp_id'];
    orgId = json['org_id'];
    ouId = json['ou_id'];
    name = json['name'];
    logoUrl = json['logo_url'];
    profileUrl = json['profile_url'];
    noUsers = json['no_users'];
    owners = json['owners'].cast<String>();
    isDefault = json['is_default'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lsp_id'] = this.lspId;
    data['org_id'] = this.orgId;
    data['ou_id'] = this.ouId;
    data['name'] = this.name;
    data['logo_url'] = this.logoUrl;
    data['profile_url'] = this.profileUrl;
    data['no_users'] = this.noUsers;
    data['owners'] = this.owners;
    data['is_default'] = this.isDefault;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}

class OrgData {
  String? orgId;
  String? name;
  String? logoUrl;
  String? industry;
  String? type;
  String? subdomain;
  int? employeeCount;
  String? website;
  String? linkedinUrl;
  String? facebookUrl;
  String? twitterUrl;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;

  OrgData(
      {this.orgId,
      this.name,
      this.logoUrl,
      this.industry,
      this.type,
      this.subdomain,
      this.employeeCount,
      this.website,
      this.linkedinUrl,
      this.facebookUrl,
      this.twitterUrl,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  OrgData.fromJson(Map<String, dynamic> json) {
    orgId = json['org_id'];
    name = json['name'];
    logoUrl = json['logo_url'];
    industry = json['industry'];
    type = json['type'];
    subdomain = json['subdomain'];
    employeeCount = json['employee_count'];
    website = json['website'];
    linkedinUrl = json['linkedin_url'];
    facebookUrl = json['facebook_url'];
    twitterUrl = json['twitter_url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['org_id'] = this.orgId;
    data['name'] = this.name;
    data['logo_url'] = this.logoUrl;
    data['industry'] = this.industry;
    data['type'] = this.type;
    data['subdomain'] = this.subdomain;
    data['employee_count'] = this.employeeCount;
    data['website'] = this.website;
    data['linkedin_url'] = this.linkedinUrl;
    data['facebook_url'] = this.facebookUrl;
    data['twitter_url'] = this.twitterUrl;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}

// Model for LSP with data we want in shared preferences
class LspModel {
  String userId;
  String userLspId;
  String lspId;
  String orgId;
  String status;
  String name;
  String logoUrl;

  LspModel({
    required this.userLspId,
    required this.userId,
    required this.lspId,
    required this.orgId,
    required this.status,
    required this.name,
    required this.logoUrl,
  });

  LspModel.fromJson(Map<String, dynamic> json)
      : userLspId = json['userLspId'],
        userId = json['userId'],
        lspId = json['lspId'],
        orgId = json['orgId'],
        status = json['status'],
        name = json['name'],
        logoUrl = json['logoUrl'];

  Map<String, dynamic> toJson() => {
        'userLspId': userLspId,
        'userId': userId,
        'lspId': lspId,
        'orgId': orgId,
        'status': status,
        'name': name,
        'logoUrl': logoUrl,
      };
}
