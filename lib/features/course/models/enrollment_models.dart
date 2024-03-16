import 'package:stc_training/features/course/models/course_models.dart';
import 'package:stc_training/features/course/models/learning_progress_models.dart';

class AllEnrollmentsModel {
  String? startCursor;
  String? endCursor;
  bool? hasNextPage;
  bool? hasPreviousPage;

  int? _totalCount;
  late List<EnrollmentModel> _enrollments;

  List<EnrollmentModel> get enrollments => _enrollments;
  int? get totalCount => _totalCount;

  AllCoursesModel({required totalCount, required enrollments}) {
    _totalCount = totalCount;
    _enrollments = enrollments;
  }

  AllEnrollmentsModel.init() {
    _totalCount = 0;
    _enrollments = <EnrollmentModel>[];
  }

  AllEnrollmentsModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    startCursor = json['pageInfo']['startCursor'];
    endCursor = json['pageInfo']['endCursor'];
    hasNextPage = json['pageInfo']['hasNextPage'];
    hasPreviousPage = json['pageInfo']['hasPreviousPage'];

    var edges = json['edges'];
    if (edges != null) {
      _enrollments = <EnrollmentModel>[];
      edges.forEach((data) {
        _enrollments.add(EnrollmentModel.fromJson(data["node"]));
      });
    }
  }
}

class EnrollmentModel {
  int? pk;
  String? id;

  CourseModel? course;

  CompoundCoursesModel? compoundCourses;
  CourseLanguageModel? courseLanguage;

  AllLearningProgressModel? allLearningProgress;

  EnrollmentModel({
    this.pk,
    this.id,
    this.course,
    this.compoundCourses,
    this.courseLanguage,
    this.allLearningProgress,
  });

  EnrollmentModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];

    if (json['course'] != null) {
      course = CourseModel.fromJson(json['course']);
    }

    if (json['learningprogressSet'] != null) {
      allLearningProgress =
          AllLearningProgressModel.fromJson(json['learningprogressSet']);
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EnrollmentModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CourseLanguageModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
