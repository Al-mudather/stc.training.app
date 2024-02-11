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

  AllCoursesModel.init() {
    _totalCount = 0;
    _courses = <CourseModel>[];
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
  int? period;
  int? totalHours;
  String? title;
  String? telegramLink;
  String? examLink;
  String? courseFee;
  String? courseFeeInSdg;
  String? profile;
  String? cover;
  String? currency;
  String? brief;
  bool? isPaid;
  bool? allowEnrollment;
  bool? isCompound;

  CategoryModel? category;
  CompoundCoursesModel? compoundCourses;
  CourseLanguageModel? courseLanguage;

  CourseModel({
    this.pk,
    this.id,
    this.period,
    this.totalHours,
    this.title,
    this.telegramLink,
    this.examLink,
    this.courseFee,
    this.courseFeeInSdg,
    this.profile,
    this.cover,
    this.currency,
    this.brief,
    this.category,
    this.compoundCourses,
    this.courseLanguage,
    this.isPaid,
    this.allowEnrollment,
    this.isCompound,
  });

  CourseModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    period = json['period'];
    totalHours = json['totalHours'];
    id = json['id'];
    title = json['title'];
    telegramLink = json['telegramLink'];
    examLink = json['examLink'];
    courseFee = json['courseFee'];
    courseFeeInSdg = json['courseFeeInSdg'];
    profile = json['profile'];
    cover = json['cover'];
    currency = json['currency'];
    brief = json['brief'];
    isPaid = json['isPaid'];
    allowEnrollment = json['allowEnrollment'];
    isCompound = json['isCompound'];

    if (json['courseSpeciality'] != null) {
      category = CategoryModel.fromJson(json['courseSpeciality']);
    }
    if (json['compoundCourses'] != null) {
      compoundCourses = CompoundCoursesModel.fromJson(json['compoundCourses']);
    }
    if (json['courseLanguage'] != null) {
      courseLanguage = CourseLanguageModel.fromJson(json['courseLanguage']);
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CourseModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}

class CompoundCoursesModel {
  int? _totalCount;
  late List<CourseModel> _courses;

  List<CourseModel> get courses => _courses;
  int? get totalCount => _totalCount;

  CompoundCoursesModel({required totalCount, required courses}) {
    _totalCount = totalCount;
    _courses = courses;
  }

  CompoundCoursesModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];

    var edges = json['edges'];
    if (edges != null) {
      _courses = <CourseModel>[];
      edges.forEach((data) {
        _courses.add(CourseModel.fromJson(data["node"]));
      });
    }
  }
}

class CourseLanguageModel {
  int? pk;
  String? id;
  String? name;
  String? code;

  CourseLanguageModel({
    this.pk,
    this.id,
    this.name,
    this.code,
  });

  CourseLanguageModel.fromJson(Map<String, dynamic> json) {
    pk = json["pk"];
    id = json["id"];
    name = json["languageName"];
    code = json["languageCode"];
  }
}
