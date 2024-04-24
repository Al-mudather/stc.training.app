import 'package:flutter/material.dart';
import 'package:stc_training/services/CRUD/offline_unit_model.dart';

@immutable
class OfflineVideoModel {
  final int pk;
  final String id;
  final String title;
  final String storagePath;
  final DownloadStatus downloadStatus;
  final int unitId;

  OfflineVideoModel({
    required this.pk,
    required this.id,
    required this.title,
    required this.storagePath,
    required this.downloadStatus,
    required this.unitId,
  });

  OfflineVideoModel.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as String,
        pk = map[pkColumn] as int,
        title = map[titleColumn] as String,
        storagePath = map[storagePathColumn] as String,
        // downloadStatus = map[downloadStatusColumn] as DownloadStatus;
        downloadStatus = DownloadStatus.values.firstWhere((e) =>
            e.toString() ==
            'DownloadStatus.' + (map['downloadStatusColumn'] as String)),
        unitId = map[unitIdColumn] as int;

  Map<String, dynamic> toMap() {
    return {
      'pk': pk,
      'id': id,
      'title': title,
      'storagePath': storagePath,
      'downloadStatus':
          downloadStatus.toString().split('.').last // Convert enum to string
    };
  }

  @override
  String toString() => 'Video title = $title,  pk =$pk';

  @override
  bool operator ==(covariant OfflineVideoModel other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const idColumn = 'id';
const pkColumn = 'pk';
const titleColumn = 'title';
const storagePathColumn = 'storagePath';
const downloadStatusColumn = 'downloadStatus';

enum DownloadStatus { Downloaded, Downloading, NotDownloaded }
