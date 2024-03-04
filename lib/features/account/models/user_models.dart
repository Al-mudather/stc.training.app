class AllUsersModel {
  int? _totalCount;
  late List<UserModel> _users;

  List<UserModel> get allUsers => _users;
  int? get totalCount => _totalCount;

  AllUsersModel({required totalCount, required certificates}) {
    _totalCount = totalCount;
    _users = certificates;
  }

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    _totalCount = json['totalCount'];
    var edges = json['edges'];
    if (edges != null) {
      _users = <UserModel>[];
      edges.forEach((data) {
        _users.add(UserModel.fromJson(data["node"]));
      });
    }
  }
}

class UserModel {
  int? pk;
  String? id;
  String? fullName;
  String? firstName;
  String? lastName;
  String? email;

  UserModel({
    this.pk,
    this.id,
    this.fullName,
    this.firstName,
    this.lastName,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    id = json['id'];
    fullName = json['fullName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.pk == pk;
  }

  @override
  int get hashCode => pk.hashCode;
}
