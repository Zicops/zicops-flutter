class LspModel {
  String userLspId;
  String userId;
  String lspId;
  String status;

  LspModel(
    this.userLspId,
    this.userId,
    this.lspId,
    this.status,
  );

  LspModel.fromJson(Map<String, dynamic> json)
      : userLspId = json['userLspId'],
        userId = json['userId'],
        lspId = json['lspId'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'userLspId': userLspId,
        'userId': userId,
        'lspId': lspId,
        'status': status,
      };
}
