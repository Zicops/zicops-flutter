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
