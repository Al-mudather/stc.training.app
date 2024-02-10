import 'package:stc_training/features/category/models/category_models.dart';

class AllCoursesModel {
  String? startCursor;
  String? endCursor;
  bool? hasNextPage;
  bool? hasPreviousPage;

  int? _totalCount;
  late List<CourseModel> _courses;

  List<CourseModel> get courses => _courses;
  int? get totalCount => _totalCount;

  AllCoursesModel({required totalCount, required courses}) {
    _totalCount = totalCount;
    _courses = courses;
  }

  AllCoursesModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    startCursor = json['pageInfo']['startCursor'];
    endCursor = json['pageInfo']['endCursor'];
    hasNextPage = json['pageInfo']['hasNextPage'];
    hasPreviousPage = json['pageInfo']['hasPreviousPage'];

    var edges = json['edges'];
    if (edges != null) {
      _courses = <CourseModel>[];
      edges.forEach((data) {
        _courses.add(CourseModel.fromJson(data["node"]));
      });
    }
  }
}

class CourseModel {
  int? pk;
  String? id;
  String? title;
  String? courseFee;
  String? courseFeeInSdg;
  String? profile;
  String? cover;
  String? currency;
  bool? isPaid;

  CategoryModel? category;

  CourseModel({
    this.pk,
    this.id,
    this.title,
    this.isPaid,
    this.courseFee,
    this.courseFeeInSdg,
    this.profile,
    this.cover,
    this.currency,
    this.category,
  });

  CourseModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
    title = json['title'];
    isPaid = json['isPaid'];
    courseFee = json['courseFee'];
    courseFeeInSdg = json['courseFeeInSdg'];
    profile = json['profile'];
    cover = json['cover'];
    currency = json['currency'];

    category = CategoryModel.fromJson(json['courseSpeciality']);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CourseModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
