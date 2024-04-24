import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'package:stc_training/services/CRUD/offline_course_model.dart';
import 'package:stc_training/services/CRUD/offline_unit_model.dart';
import 'package:stc_training/services/CRUD/offline_video_model.dart';

class DatabaseAlreadyOpenException implements Exception {}

class UnableToGetDocumentsDirectoryException implements Exception {}

class DataBaseIsNotOpenException implements Exception {}

class CouldNotDeleteVideoException implements Exception {}

class CouldNotDeleteUnitException implements Exception {}

class CouldNotDeleteCourseException implements Exception {}

class CourseAlreadyExistsException implements Exception {}

class CourseService {
  Database? _db;

  //todo: CREATE cousre
  Future<bool> createOfflineCourse(OfflineCourseModel course) async {
    final db = _getDatabaseOrThrow();
    //todo: check if the course all ready exists
    final List<Map<String, dynamic>> results = await db.query(
      offlineCourseTable,
      limit: 1,
      where: 'pk = ?',
      whereArgs: [course.pk],
    );
    if (results.isNotEmpty) {
      throw CourseAlreadyExistsException();
    }
    return true;
    // return await db.insert(
    //   offlineCourseTable,
    //   course
    //       .toMap(), // Assuming toMap() method is properly implemented in OfflineCourseModel
    //   conflictAlgorithm: ConflictAlgorithm
    //       .replace, // To handle cases where the same PK might be inserted
    // );
  }

  //todo: get single course
  // Method to fetch a single course by its primary key
  Future<OfflineCourseModel?> getCourse(int pk) async {
    final db = _getDatabaseOrThrow();
    // final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM OfflineCourse WHERE pk = ?', [pk]);
    final List<Map<String, dynamic>> maps = await db.query(
      offlineCourseTable,
      limit: 1,
      where: 'pk = ?',
      whereArgs: [pk],
    );
    if (maps.isNotEmpty) {
      return OfflineCourseModel.fromJson(maps.first);
    }
    return null;
  }

  //todo: CREATE unit
  Future<int> insertUnit(OfflineUnitModel unit) async {
    final db = _getDatabaseOrThrow();
    return await db.insert(
      offlineUnitTable,
      unit.toMap(), // Assuming toMap() method is implemented in OfflineUnitModel
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //todo: CREATE video
  Future<int> insertVideo(OfflineVideoModel video) async {
    final db = _getDatabaseOrThrow();
    return await db.insert(
      'OfflineVideo',
      video
          .toMap(), // Assuming toMap() method is implemented in OfflineVideoModel
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //todo: delete course
  Future<void> deleteCourse(int coursePk) async {
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(
      offlineCourseTable,
      where: 'pk = ?',
      whereArgs: [coursePk],
    );
    // Since units and videos are deleted by cascading, no need to explicitly delete them here
    if (deletedCount != 1) {
      throw CouldNotDeleteCourseException();
    }
  }

  //todo: delete unit
  Future<void> deleteUnit(int unitPk) async {
    final db = _getDatabaseOrThrow();

    final deletedCount = await db.delete(
      offlineUnitTable,
      where: 'pk = ?',
      whereArgs: [unitPk],
    );

    if (deletedCount != 1) {
      throw CouldNotDeleteUnitException();
    }
  }

  //todo: delete video
  Future<void> deleteVideo({required int videoPk}) async {
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(
      offlineVideoTable,
      where: 'pk = ?',
      whereArgs: [videoPk],
    );

    if (deletedCount != 1) {
      throw CouldNotDeleteVideoException();
    }
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DataBaseIsNotOpenException();
    } else {
      return db;
    }
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }

    try {
      //tODO: Get the ApplicationDocumentsDirectory
      final docsPath = await getApplicationDocumentsDirectory();
      //tODO: create the database path
      final dbPath = join(docsPath.path, dbName);
      //tODO: open the database
      final db = await openDatabase(dbPath);
      //tODO: assigne the database globally
      _db = db;
      //tODO: Create the tables if there are not exists
      //? Create the course table
      await db.execute(createCourseTable);
      //? Create the unit table
      await db.execute(createUnitTable);
      //? Create the table for the videos
      await db.execute(createVideoTable);
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectoryException();
    } catch (e) {}
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DataBaseIsNotOpenException();
    } else {
      await db.close();
      _db = null;
    }
  }
}

const dbName = 'offlineCourses.db';
const offlineCourseTable = 'OfflineCourse';
const offlineUnitTable = 'OfflineUnit';
const offlineVideoTable = 'OfflineVideo';

const createUnitTable = '''CREATE TABLE IF NOT EXISTS OfflineUnit (
    pk INTEGER PRIMARY KEY,
    id TEXT,
    title TEXT NOT NULL,
    isExternal BOOLEAN,
    courseId INTEGER,
    FOREIGN KEY (courseId) REFERENCES OfflineCourse(pk) ON DELETE CASCADE
);
 ''';

const createCourseTable = '''
        CREATE TABLE IF NOT EXISTS OfflineCourse (
            id TEXT,
            pk INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            totalHours TEXT,
            profile TEXT NOT NULL,
            cover TEXT NOT NULL,
            courseHours TEXT
        );''';

const createVideoTable = '''CREATE TABLE IF NOT EXISTS OfflineVideo (
    pk INTEGER PRIMARY KEY,
    id TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    storagePath TEXT NOT NULL,
    downloadStatus TEXT NOT NULL,
    unitId INTEGER NOT NULL,
    FOREIGN KEY (unitId) REFERENCES OfflineUnit(pk) ON DELETE CASCADE
);
''';
