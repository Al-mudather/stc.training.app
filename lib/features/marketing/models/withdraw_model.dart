import 'package:stc_training/features/course/models/course_unit_content_model.dart';
import 'package:stc_training/helper/methods.dart';

class AllWithdrawsModel {
  String? startCursor;
  String? endCursor;
  bool? hasNextPage;
  bool? hasPreviousPage;

  int? _totalCount;
  int? get totalCount => _totalCount;

  late List<WithdrawModel> _withdraws;
  List<WithdrawModel> get wihthdraws => _withdraws;

  AllWithdrawsModel({required courseUnits, required totalCount}) {
    _withdraws = courseUnits;
    _totalCount = totalCount;
  }

  AllWithdrawsModel.init() {
    _totalCount = 0;
    _withdraws = <WithdrawModel>[];
  }

  AllWithdrawsModel.fromJson(Map<String, dynamic> json) {
    LOG_THE_DEBUG_DATA(messag: json);
    // _totalCount = json['totalCount'];
    // startCursor = json['pageInfo']['startCursor'];
    // endCursor = json['pageInfo']['endCursor'];
    // hasNextPage = json['pageInfo']['hasNextPage'];
    // hasPreviousPage = json['pageInfo']['hasPreviousPage'];

    // var edges = json['edges'];
    // if (edges != null) {
    //   _withdraws = <WithdrawModel>[];
    //   edges.forEach((data) {
    //     _withdraws.add(WithdrawModel.fromJson(data["node"]));
    //   });
    // }
  }
}

class WithdrawModel {
  int? pk;
  String? id;
  String? amount;
  bool? isDone;
  String? created;

  AllCourseUnitContentsModel? courseUnitContents;

  WithdrawModel({
    this.pk,
    this.id,
    this.amount,
    this.isDone,
    this.courseUnitContents,
  });

  WithdrawModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
    amount = json['amount'];
    isDone = json['isDone'];
    created = json['created'];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WithdrawModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
