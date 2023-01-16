class AllCatMainModel {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? code;
  String? createdAt;
  String? updatedAt;
  bool? isActive;

  AllCatMainModel(
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.isActive,
  );
}

class SubCatMainModel {
  String catId;
  String id;
  String name;
  String description;
  String imageUrl;
  String code;
  String createdAt;
  String updatedAt;
  bool isActive;

  SubCatMainModel(
    this.catId,
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.isActive,
  );
}
