class AllLearningProgressModel {
  // String? startCursor;
  // String? endCursor;
  // bool? hasNextPage;
  // bool? hasPreviousPage;

  int? _totalCount;
  int? get totalCount => _totalCount;

  late List<LearningProgressModel> _allLearningProgress;
  List<LearningProgressModel> get allLearningProgress => _allLearningProgress;

  AllCoursesModel({required totalCount, required allLearningProgress}) {
    _totalCount = totalCount;
    _allLearningProgress = allLearningProgress;
  }

  AllLearningProgressModel.init() {
    _totalCount = 0;
    _allLearningProgress = <LearningProgressModel>[];
  }

  AllLearningProgressModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    // startCursor = json['pageInfo']['startCursor'];
    // endCursor = json['pageInfo']['endCursor'];
    // hasNextPage = json['pageInfo']['hasNextPage'];
    // hasPreviousPage = json['pageInfo']['hasPreviousPage'];

    var edges = json['edges'];
    if (edges != null) {
      _allLearningProgress = <LearningProgressModel>[];
      edges.forEach((data) {
        _allLearningProgress.add(LearningProgressModel.fromJson(data["node"]));
      });
    }
  }
}

class LearningProgressModel {
  int? pk;
  String? id;

  LearningProgressModel({
    this.pk,
    this.id,
  });

  LearningProgressModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LearningProgressModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
