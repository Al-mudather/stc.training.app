import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/services/CRUD/offline_course_model.dart';
import 'package:stc_training/services/CRUD/offline_video_model.dart';

//Todo: prepare the offline course unit content

class AllOfflineUnitsModel {
  late List<OfflineUnitModel> _courseUnits;
  List<OfflineUnitModel> get courseUnits => _courseUnits;

  AllOfflineUnitsModel({required courseUnits, required totalCount}) {
    _courseUnits = courseUnits;
  }

  AllOfflineUnitsModel.init() {
    _courseUnits = <OfflineUnitModel>[];
  }

  AllOfflineUnitsModel.fromRow(Map<String, dynamic> json) {
    var edges = json['edges'];
    if (edges != null) {
      _courseUnits = <OfflineUnitModel>[];
      edges.forEach((data) {
        _courseUnits.add(OfflineUnitModel.fromRow(data["node"]));
      });
    }
  }
}

class OfflineUnitModel {
  int? pk;
  String? id;
  String? title;
  bool? isExternal;
  int? courseId;
  // OfflineCourseModel? course;

  List<OfflineVideoModel>? videos;

  OfflineUnitModel({
    this.pk,
    this.id,
    this.title,
    this.isExternal,
    // this.course,
    this.videos,
    this.courseId,
  });

  OfflineUnitModel.fromRow(Map<String, Object?> map) {
    id = map[unitIdColumn] as String;
    pk = map[unitPkColumn] as int;
    title = map[unitTitleColumn] as String;
    isExternal = map[unitIsExternalColumn] as bool;
    courseId = map[coursePkColumn] as int;
    videos = (map['videos'] as List<dynamic>?)
        ?.map((v) => OfflineVideoModel.fromJson(v))
        .toList();
  }

  // OfflineUnitModel.fromJson(Map<String, dynamic> json) {
  //   pk = json['pk'];
  //   id = json['id'];
  //   title = json['title'];
  //   isExternal = json['isExternal'];
  //   // if (json['course'] != null) {
  //   //   course = OfflineCourseModel.fromJson(json['course']);
  //   // }

  //   if (json['videos'] != null) {
  //     videos =
  //     (json['videos'] as List<dynamic>?)
  //         ?.map((v) => OfflineVideoModel.fromJson(v))
  //         .toList();
  //   }
  // }

  factory OfflineUnitModel.fromJson(Map<String, dynamic> json) {
    return OfflineUnitModel(
      pk: json['pk'],
      id: json['id'],
      title: json['title'],
      isExternal: json['isExternal'] == 1,
      courseId: json['courseId'],
      videos: (json['videos'] as List<dynamic>?)
          ?.map((v) => OfflineVideoModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pk': pk,
      'id': id,
      'title': title,
      'isExternal':
          isExternal == true ? 1 : 0, // Convert boolean to integer for SQLite
      'courseId': courseId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OfflineUnitModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}

const unitIdColumn = "id";
const unitPkColumn = "pk";
const unitTitleColumn = "title";
const unitIsExternalColumn = "isExternal";
const unitIsCourseColumn = "course";
