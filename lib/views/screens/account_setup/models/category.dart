class Category {
  int id;
  String category;
  int? parentCategory;

  Category(this.id, this.category, this.parentCategory);
}

class AllCat{
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? code;

  AllCat(this.id,this.name,this.description,this.code,this.imageUrl);
}