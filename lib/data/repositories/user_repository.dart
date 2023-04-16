import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:wasseoyo/data/models/user.dart';
import 'package:wasseoyo/utils/constants/uri_constant.dart';

class UserRepository {
  // 회원 리스트 가져오기
  Future<List<User>> getUserList() async {
    List<User> users = [];

    try {
      var response = await http.get(
        Uri.parse("$BASE_URI/get/users"),
        //headers: {"Content-Type":"application/json"},
      );

      Map jsonResponse = jsonDecode(response.body);

      for (var user in jsonResponse["user"]) {
        users.add(user);
        log("user : [${user['id']}, ${user['name']}, ${user['nickname']}]");
      }

      return User.modelsFromSnapshot(users);
    } catch (error) {
      log("request failed at [getUserList] \nerror : $error");
    }

    return users;
  }

  // 회원 정보 가져오기
  Future<User> getUserInfo(String userId) async {
    User user = User.nullToInit();

    try {
      var response = await http.get(
        Uri.parse("$BASE_URI/get/user/$userId"),
        //headers: {"Content-Type":"application/json"},
      );

      Map jsonResponse = jsonDecode(response.body);

      user = User.fromJson(jsonResponse["user"]);

      log("user : [${user.id}, ${user.name}, ${user.nickName}]");
    } catch (error) {
      log("request failed at [getUserInfo] \nerror : $error");
    }

    return user;
  }

  // 로그인
  Future<User> login(String userId, String password) async {
    User user = User.nullToInit();

    try {
      var response = await http.post(
        Uri.parse("$BASE_URI/post/user/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "id": userId,
          "password": password,
        }),
      );

      Map jsonResponse = jsonDecode(response.body);

      user = User.fromJson(jsonResponse["user"]);

      log("user : [${user.id}, ${user.name}, ${user.nickName}]");
    } catch (error) {
      log("request failed at [login] \nerror : $error");
    }

    return user;
  }
}
