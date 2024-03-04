import 'package:stc_training/features/course/models/course_unit_model.dart';
import 'package:stc_training/helper/methods.dart';

class AllCourseUnitContentsModel {
  int? _totalCount;
  int? get totalCount => _totalCount;

  late List<CourseUnitContentModel> _courseUnitContents;
  List<CourseUnitContentModel> get courseUnitContents => _courseUnitContents;

  AllCourseUnitsModel({required courseUnitContents, required totalCount}) {
    _courseUnitContents = courseUnitContents;
    _totalCount = totalCount;
  }

  AllCourseUnitContentsModel.init() {
    _totalCount = 0;
    _courseUnitContents = <CourseUnitContentModel>[];
  }

  AllCourseUnitContentsModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    var edges = json['edges'];
    LOG_THE_DEBUG_DATA(messag: edges);
    if (edges != null) {
      _courseUnitContents = <CourseUnitContentModel>[];
      edges.forEach((data) {
        _courseUnitContents.add(CourseUnitContentModel.fromJson(data["node"]));
      });
    }
  }
}

class CourseUnitContentModel {
  String? id;
  int? pk;
  int? order;
  bool? isFree;
  bool? isMandatory;
  String? modelName;
  String? modelValue;

  CourseUnitModel? courseUnit;

  CourseUnitContentModel({
    this.id,
    this.pk,
    this.order,
    this.isMandatory,
    this.isFree,
    this.modelName,
    this.modelValue,
    this.courseUnit,
  });

  CourseUnitContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pk = json['pk'];
    order = json['order'];
    isMandatory = json['isMandatory'];
    isFree = json['isFree'];
    modelName = json['modelName'];
    modelValue = json['modelValue'];
    if (json["courseUnit"] != null) {
      courseUnit = CourseUnitModel.fromJson(json["courseUnit"]);
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CourseUnitContentModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
