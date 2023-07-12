
import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:loginmapa/database/helpers.dart';

import '../models/user.dart';

class UserDao {
  final isar = IsarHelper.instance.isar;

  Future<List<User>> getAll() async {
    List<User> usuarios = await isar!.users.where().findAll();
    log(usuarios.length.toString());
    return usuarios;

  }


  Future<int> upsert(User user) async {
    return isar!.writeTxn(() => isar!.users.put(user));
  }
}
