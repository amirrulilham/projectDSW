import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectsdw/DataLayer/Model/dependentModel.dart';
import 'package:projectsdw/DataLayer/Model/profileInfoModel.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  Db._privateContructor();

  static final Db instance = Db._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database db, int version) async {
    try {
      await db.execute('''
CREATE TABLE ProfileInfo(id INTEGER PRIMARY KEY AUTOINCREMENT,icNum TEXT, type TEXT,name TEXT,address TEXT,  username TEXT, password TEXT, phoneNum TEXT, emailAddress TEXT)
''');
      await db.execute('''
CREATE TABLE Dependent(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, relation TEXT,gender TEXT,age INT)
''');
    } catch (e, stacktrace) {
      log(e.toString());
      log(stacktrace.toString());
    }
  }

  //add Profile Info data
  Future<int> addProfileInfo(ProfileInfoModel profileInfoModel) async {
    Database db = await instance.database;
    return await db.insert('ProfileInfo', profileInfoModel.toJson());
  }

  //add Dependent data
  Future<int> addDependent(DependentModel dependentModel) async {
    Database db = await instance.database;
    return await db.insert('Dependent', dependentModel.toJson());
  }

  //get all Profile data
  Future<List<ProfileInfoModel>> getAllProfileInfoData() async {
    Database db = await instance.database;
    final profileInfoModel = await db.query('ProfileInfo', orderBy: 'name');
    return profileInfoModel
        .map((json) => ProfileInfoModel.fromJson(json))
        .toList();
  }

  //get all Dependent data
  Future<List<DependentModel>> getAllDependentData() async {
    Database db = await instance.database;
    final dependentModel = await db.query('Dependent', orderBy: 'name');
    return dependentModel.map((json) => DependentModel.fromJson(json)).toList();
  }

  //get specific Profile Info data
  Future<ProfileInfoModel> getSpecificProfileInfoData(int id) async {
    Database db = await instance.database;
    final profileInfoData = await db.query('ProfileInfo',
        columns: [
          'id',
          'type',
          'name',
          'address',
          'username',
          'password',
          'phoneNum',
          'emailAddress'
        ],
        where: 'id = ?',
        whereArgs: [id]);

    if (profileInfoData.isNotEmpty) {
      return ProfileInfoModel.fromJson(profileInfoData.first);
    }

    throw Exception('ID not found');
  }

  Future<ProfileInfoModel> getSpecificProfileInfoDataUsername(
      String username, String password) async {
    Database db = await instance.database;
    final profileInfoData = await db.query('ProfileInfo',
        columns: [
          'id',
          'type',
          'name',
          'address',
          'username',
          'password',
          'phoneNum',
          'emailAddress'
        ],
        where: 'username = ?, password = ?',
        whereArgs: [username, password]);

    if (profileInfoData.isNotEmpty) {
      return ProfileInfoModel.fromJson(profileInfoData.first);
    }

    throw Exception('ID not found');
  }

  //get specific Dependent  data
  Future<DependentModel> getSpecificDependentData(int id) async {
    Database db = await instance.database;
    final dependentData = await db.query('Dependent',
        columns: [
          'id',
          'name',
          'relation',
          'gender',
          'age',
        ],
        where: 'id = ?',
        whereArgs: [id]);

    if (dependentData.isNotEmpty) {
      return DependentModel.fromJson(dependentData.first);
    }

    throw Exception('ID not found');
  }

  //update Profile Info Data
  Future<int> updateProfileInfo(ProfileInfoModel profileInfoModel) async {
    Database db = await instance.database;

    return db.update(
      'ProfileInfo',
      profileInfoModel.toJson(),
      where: 'id = ?',
      whereArgs: [profileInfoModel.id],
    );
  }

  //update Dependent Data
  Future<int> updateDependent(DependentModel dependentModel) async {
    Database db = await instance.database;

    return db.update(
      'Dependent',
      dependentModel.toJson(),
      where: 'id = ?',
      whereArgs: [dependentModel.id],
    );
  }

  //delete Profile Info Data
  Future<int> deleteProfileInfo(int id) async {
    Database db = await instance.database;

    return db.delete(
      'ProfileInfo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete dependent Data
  Future<int> deleteDependent(int id) async {
    Database db = await instance.database;

    return db.delete(
      'Dependent',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
