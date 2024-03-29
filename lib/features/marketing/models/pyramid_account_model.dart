import 'package:stc_training/features/account/models/user_models.dart';
import 'package:stc_training/helper/methods.dart';

class PyramidAccountModel {
  int? pk;
  String? id;
  String? pyramidId;
  String? pyramidCode;

  bool? isBlocked;
  bool? isAdmin;
  bool? isSuperuser;

  String? created;

  UserModel? user;
  PyramidAccountModel? parent;

  PyramidAccountModel({
    this.pk,
    this.id,
    this.pyramidId,
    this.user,
    this.parent,
    this.pyramidCode,
    this.isBlocked,
    this.isAdmin,
    this.isSuperuser,
  });

  PyramidAccountModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
    pyramidId = json['pyramidId'];
    if (json['user'] != null) {
      user = UserModel.fromJson(json['user']);
    }
    if (json['parent'] != null) {
      parent = PyramidAccountModel.fromJson(json['parent']);
    }

    pyramidCode = json['pyramidCode'];
    isBlocked = json['isBlocked'];
    isAdmin = json['isAdmin'];
    isSuperuser = json['isSuperuser'];
    created = json['created'];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PyramidAccountModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
