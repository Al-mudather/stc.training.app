import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/features/course/models/course_unit_content_model.dart';

class AllCourseUnitsModel {
  String? startCursor;
  String? endCursor;
  bool? hasNextPage;
  bool? hasPreviousPage;

  int? _totalCount;
  int? get totalCount => _totalCount;

  late List<CourseUnitModel> _courseUnits;
  List<CourseUnitModel> get courseUnits => _courseUnits;

  AllCourseUnitsModel({required courseUnits, required totalCount}) {
    _courseUnits = courseUnits;
    _totalCount = totalCount;
  }

  AllCourseUnitsModel.init() {
    _totalCount = 0;
    _courseUnits = <CourseUnitModel>[];
  }

  AllCourseUnitsModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    startCursor = json['pageInfo']['startCursor'];
    endCursor = json['pageInfo']['endCursor'];
    hasNextPage = json['pageInfo']['hasNextPage'];
    hasPreviousPage = json['pageInfo']['hasPreviousPage'];

    var edges = json['edges'];
    if (edges != null) {
      _courseUnits = <CourseUnitModel>[];
      edges.forEach((data) {
        _courseUnits.add(CourseUnitModel.fromJson(data["node"]));
      });
    }
  }
}

class CourseUnitModel {
  int? pk;
  String? id;
  String? title;
  bool? isExternal;
  CourseModel? course;

  AllCourseUnitContentsModel? courseUnitContents;

  CourseUnitModel({
    this.pk,
    this.id,
    this.title,
    this.isExternal,
    this.course,
    this.courseUnitContents,
  });

  CourseUnitModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
    title = json['title'];
    isExternal = json['isExternal'];
    if (json['course'] != null) {
      course = CourseModel.fromJson(json['course']);
    }

    if (json['external'] != null) {
      courseUnitContents = AllCourseUnitContentsModel.fromJson(
          json['external']['courseunitcontentSet']);
    } else {
      if (json['courseunitcontentSet'] != null) {
        courseUnitContents =
            AllCourseUnitContentsModel.fromJson(json['courseunitcontentSet']);
      }
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CourseUnitModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
