class OrgModel {
  String? orgName;
  String? orgUnit;
  String? lspRole;
  String? orgRole;
  String? empId;

  OrgModel({
    this.orgName,
    this.orgUnit,
    this.lspRole,
    this.orgRole,
    this.empId,
  });

  OrgModel.fromJson(Map<String, dynamic> json)
      : orgName = json['orgName'],
        orgUnit = json['orgUnit'],
        lspRole = json['lspRole'],
        orgRole = json['orgRole'],
        empId = json['empId'];

  Map<String, dynamic> toJson() => {
        'orgName': orgName,
        'orgUnit': orgUnit,
        'lspRole': lspRole,
        'orgRole': orgRole,
        'empId': empId,
      };
}
