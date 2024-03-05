import 'dart:convert';

import 'package:stc_training/features/course/models/course_unit_model.dart';

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

  String? title;
  String? video;
  String? cipherIframe;
  String? videoTime;
  String? videoTimeSeconds;
  String? video_metadata;
  bool? isMeeting;
  String? meetingType;
  String? meetingData;

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
    this.title,
    this.video,
    this.cipherIframe,
    this.videoTime,
    this.videoTimeSeconds,
    this.isMeeting,
    this.meetingType,
    this.meetingData,
  });

  CourseUnitContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pk = json['pk'];
    order = json['order'];
    isMandatory = json['isMandatory'];
    isFree = json['isFree'];
    modelName = json['modelName'];
    modelValue = json['modelValue'];

    if (modelValue != null) {
      var value = jsonDecode('$modelValue');
      title = value['title'];
      video = value['video'];
      cipherIframe = value['cipher_iframe'];
      videoTime = value['video_time'];
      videoTimeSeconds = value['video_time_seconds'];
      isMeeting = value['is_meeting'];
      meetingType = value['meeting_type'];
      meetingData = value['meeting_data'];
    }

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
