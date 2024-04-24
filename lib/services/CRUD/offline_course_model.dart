import 'package:stc_training/services/CRUD/offline_unit_model.dart';

class AllOfflineCoursesModel {
  late List<OfflineCourseModel> _courses;

  List<OfflineCourseModel> get courses => _courses;

  AllCoursesModel({required totalCount, required courses}) {
    _courses = courses;
  }

  AllOfflineCoursesModel.init() {
    _courses = <OfflineCourseModel>[];
  }

  AllOfflineCoursesModel.fromRow(Map<String, dynamic> map) {
    var items = map['allCoursesColumn'];
    if (items != null) {
      _courses = <OfflineCourseModel>[];
      items.forEach((data) {
        _courses.add(OfflineCourseModel.fromJson(data["node"]));
      });
    }
  }
}

class OfflineCourseModel {
  String? id;
  int? pk;
  String? title;
  String? totalHours;
  String? profile;
  String? cover;
  String? courseHours;
  List<OfflineUnitModel>? units;

  OfflineCourseModel({
    this.pk,
    this.id,
    this.totalHours,
    this.title,
    this.profile,
    this.cover,
    this.courseHours,
    this.units,
  });

  OfflineCourseModel.fromRow(Map<String, Object?> map) {
    id = map[courseIdColumn] as String;
    pk = map[coursePkColumn] as int;
    title = map[courseTitleColumn] as String;
    courseHours = map[courseHourseColumn] as String;
    totalHours = map[courseTotalHourseColumn] as String;
    profile = map[courseProfileColumn] as String;
    cover = map[courseCoverColumn] as String;
    units = (map['units'] as List<dynamic>?)
        ?.map((u) => OfflineUnitModel.fromJson(u))
        .toList();
  }

  OfflineCourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pk = json['pk'];
    title = json['title'];
    courseHours = json['courseHours'];
    totalHours = json['totalHours'];
    profile = json['profile'];
    cover = json['cover'];

    if (json['units'] != null) {
      units = (json['units'] as List)
          .map((u) => OfflineUnitModel.fromJson(u))
          .toList();
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'pk': pk,
      'id': id,
      'title': title,
      'totalHours': totalHours,
      'profile': profile,
      'cover': cover,
      'courseHours': courseHours
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OfflineCourseModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}

const allCoursesColumn = "couses";

const courseIdColumn = "id";
const coursePkColumn = "pk";
const courseTitleColumn = "title";
const courseHourseColumn = "courseHours";
const courseTotalHourseColumn = "totalHours";
const courseProfileColumn = "profile";
const courseCoverColumn = "cover";

const courseUnitsColumn = "units";
