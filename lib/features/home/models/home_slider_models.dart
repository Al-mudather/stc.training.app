import 'package:stc_training/features/course/models/course_models.dart';

class AllHomeSlidersModel {
  String? startCursor;
  String? endCursor;
  bool? hasNextPage;
  bool? hasPreviousPage;

  int? _totalCount;
  late List<HomeSliderModel> _sliders;

  List<HomeSliderModel> get sliders => _sliders;
  int? get totalCount => _totalCount;

  AllHomeSlidersModel({required totalCount, required sliders}) {
    _totalCount = totalCount;
    _sliders = sliders;
  }

  AllHomeSlidersModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    startCursor = json['pageInfo']['startCursor'];
    endCursor = json['pageInfo']['endCursor'];
    hasNextPage = json['pageInfo']['hasNextPage'];
    hasPreviousPage = json['pageInfo']['hasPreviousPage'];

    var edges = json['edges'];
    if (edges != null) {
      _sliders = <HomeSliderModel>[];
      edges.forEach((data) {
        _sliders.add(HomeSliderModel.fromJson(data["node"]));
      });
    }
  }
}

class HomeSliderModel {
  int? pk;
  String? id;
  String? objectId;
  bool? isPublished;

  CourseModel? course;

  HomeSliderModel({
    this.pk,
    this.id,
    this.objectId,
    this.isPublished,
    this.course,
  });

  HomeSliderModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];

    if (json['slide'] != null) {
      course = CourseModel.fromJson(json['slide']);
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeSliderModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
