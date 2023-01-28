class Category {
  String? id;
  String? category;
  String? parentCategory;

  Category(this.id, this.category, this.parentCategory);
}

class AllCat {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? code;

  AllCat(this.id, this.name, this.description, this.code, this.imageUrl);
}

class UserDetails {
  String id;
  String firstName;
  String lastName;
  String status;
  String role;
  bool isVerified;
  bool isActive;
  String gender;
  String email;
  String phone;
  String? photoUrl;

  UserDetails(
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
      this.photoUrl);
}
