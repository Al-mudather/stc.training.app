class AllCategoriesModel {
  String? startCursor;
  String? endCursor;
  bool? hasNextPage;
  bool? hasPreviousPage;

  int? _totalCount;
  late List<CategoryModel> _categories;

  List<CategoryModel> get categories => _categories;
  int? get totalCount => _totalCount;

  AllCategoriesModel({required totalCount, required categories}) {
    _totalCount = totalCount;
    _categories = categories;
  }

  AllCategoriesModel.init() {
    _totalCount = 0;
    _categories = <CategoryModel>[];
  }

  AllCategoriesModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    startCursor = json['pageInfo']['startCursor'];
    endCursor = json['pageInfo']['endCursor'];
    hasNextPage = json['pageInfo']['hasNextPage'];
    hasPreviousPage = json['pageInfo']['hasPreviousPage'];

    var edges = json['edges'];
    if (edges != null) {
      _categories = <CategoryModel>[];
      edges.forEach((data) {
        _categories.add(CategoryModel.fromJson(data["node"]));
      });
    }
  }
}

class CategoryModel {
  int? pk;
  String? id;
  String? name;
  int? totalCourses;

  CategoryModel({
    this.pk,
    this.id,
    this.name,
    this.totalCourses,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
    name = json['speciality'];

    if (json['courseSet'] != null) {
      totalCourses = json['courseSet']['totalCount'];
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
