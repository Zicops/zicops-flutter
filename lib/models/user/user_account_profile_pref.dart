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

  AllCatMainModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['Name'],
        description = json['Description'],
        imageUrl = json['ImageUrl'],
        code = json['Code'],
        createdAt = json['CreatedAt'],
        updatedAt = json['UpdatedAt'],
        isActive = json['IsActive'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'code': code,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'isActive': isActive,
      };
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

  SubCatMainModel.fromJson(Map<String, dynamic> json)
      : catId = json['CatId'],
        id = json['id'],
        name = json['Name'],
        description = json['Description'],
        imageUrl = json['ImageUrl'],
        code = json['Code'],
        createdAt = json['CreatedAt'],
        updatedAt = json['UpdatedAt'],
        isActive = json['IsActive'];

  Map<String, dynamic> toJson() => {
        'catId': catId,
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'code': code,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'isActive': isActive,
      };
}
