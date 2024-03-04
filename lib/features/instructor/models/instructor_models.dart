import 'package:stc_training/features/account/models/user_models.dart';

class AllInstructorsModel {
  int? _totalCount;
  late List<InstructorModel> _instructors;

  List<InstructorModel> get instructors => _instructors;
  int? get totalCount => _totalCount;

  AllInstructorsModel({required totalCount, required instructors}) {
    _totalCount = totalCount;
    _instructors = instructors;
  }

  AllInstructorsModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    var edges = json['edges'];
    if (edges != null) {
      _instructors = <InstructorModel>[];
      edges.forEach((data) {
        //TODO: Dont add the data that is empty
        if ('${data["node"]["user"]["fullName"]}'.isNotEmpty) {
          _instructors.add(InstructorModel.fromJson(data["node"]));
        }
      });
    }
  }
}

class InstructorModel {
  int? pk;
  String? id;
  String? image;
  String? qualification;
  // bool? isMainInstructor;

  UserModel? user;

  InstructorModel({
    this.pk,
    this.id,
    this.image,
    this.qualification,
    this.user,
  });

  InstructorModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
    image = json['image'];
    // isMainInstructor = json['isMainInstructor'];
    qualification = json['qualification'];
    user = UserModel.fromJson(json['user']);
    // if (json['instructor'] != null) {
    // }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstructorModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
