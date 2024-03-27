// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:hive/hive.dart';

// class HiveStore extends Store {
//   final Box<QueryResult> _cacheBox;

//   HiveStore(this._cacheBox);

//   @override
//   Future<void> write(String key, Map<String, dynamic> data) async {
//     await _cacheBox.put(key, QueryResult.fromJson(data));
//   }

//   @override
//   Future<Map<String, dynamic>?> read(String key) async {
//     final cachedData = _cacheBox.get(key);
//     return cachedData?.toJson();
//   }

//   @override
//   Future<void> clear() async {
//     await _cacheBox.clear();
//   }
// }
