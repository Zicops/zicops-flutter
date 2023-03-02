class CohortDetailsModel {
  String? cohortId;
  String? name;
  String? description;
  String? lspId;
  String? code;
  String? status;
  String? type;
  bool? isActive;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? size;
  String? imageUrl;
  String? role;

  CohortDetailsModel(
      {this.cohortId,
      this.name,
      this.description,
      this.lspId,
      this.code,
      this.status,
      this.type,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.size,
      this.imageUrl,
      this.role});

  CohortDetailsModel.fromJson(Map<String, dynamic> json) {
    cohortId = json['cohort_id'];
    name = json['name'];
    description = json['description'];
    lspId = json['lsp_id'];
    code = json['code'];
    status = json['status'];
    type = json['type'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    size = json['size'];
    imageUrl = json['imageUrl'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cohort_id'] = this.cohortId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['lsp_id'] = this.lspId;
    data['code'] = this.code;
    data['status'] = this.status;
    data['type'] = this.type;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['size'] = this.size;
    data['imageUrl'] = this.imageUrl;
    data['role'] = this.role;
    return data;
  }
}
