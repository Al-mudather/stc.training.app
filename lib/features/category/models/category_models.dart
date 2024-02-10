class CategoryModel {
  int? pk;
  String? id;
  String? name;

  CategoryModel({
    this.pk,
    this.id,
    this.name,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
    name = json['speciality'];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
