import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasseoyo/data/models/user.dart';
import 'package:wasseoyo/data/services/user_service.dart';

class UserViewModel with ChangeNotifier {
  late final UserService _userService;

  late List<User> _userList;
  late User _user;
  bool autoLoginChecked = true;
  bool loginFailed = false;
  bool changeFailed = false;
  String errorMessage = '';
  bool agree = false;

  List<User> get userList => _userList;
  User get user => _user;

  UserViewModel() {
    _userService = UserService();
  }

  void getUserList() async {
    _userList = await _userService.getUserList();
    notifyListeners();
  }

  void getUserInfo(String userId) async {
    _user = await _userService.getUserInfo(userId);
    notifyListeners();
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString("userId") ?? "";

    if (userId.isNotEmpty) {
      _user = await _userService.getUserInfo(userId);
      return true;
    }

    return false;
  }

  Future<bool> login(String userId, String password) async {
    _user = await _userService.login(userId, password);

    if (_user.id == "") {
      loginFailed = true;
      notifyListeners();
      return false;
    } else {
      loginFailed = false;
      notifyListeners();
      return true;
    }
  }

  Future<bool> changePassword(String password) async {
    User user = await _userService.changePassword(_user.id, password);

    if (user.id == "") {
      changeFailed = true;
      notifyListeners();
      return false;
    } else {
      _user = user;
      changeFailed = false;
      notifyListeners();
      return true;
    }
  }

  void agreeCheck() {
    agree = !agree;
    notifyListeners();
  }

  void autoLoginCheck() {
    autoLoginChecked = !autoLoginChecked;
    notifyListeners();
  }

  void changePw() {
    changeFailed = !changeFailed;
    notifyListeners();
  }
}
