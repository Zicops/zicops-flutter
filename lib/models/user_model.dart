class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? status;
  String? role;
  bool? isVerified;
  bool? isActive;
  String? gender;
  String? email;
  String? phone;
  String? photoUrl;

  UserModel(
    this.id,
    this.firstName,
    this.lastName,
    this.status,
    this.role,
    this.isVerified,
    this.isActive,
    this.gender,
    this.email,
    this.phone,
    this.photoUrl,
  );

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        status = json['status'],
        role = json['role'],
        isVerified = json['is_verified'],
        isActive = json['is_active'],
        gender = json['gender'],
        email = json['email'],
        phone = json['phone'],
        photoUrl = json['photo_url'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'status': status,
        'role': role,
        'is_verified': isVerified,
        'is_active': isActive,
        'email': email,
        'phone': phone,
        'photo_url': photoUrl,
      };
}
