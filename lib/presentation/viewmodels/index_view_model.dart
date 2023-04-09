import 'package:flutter/material.dart';
import 'package:wasseoyo/data/models/user.dart';
import 'package:wasseoyo/data/services/user_service.dart';

class IndexViewModel with ChangeNotifier {
  late final UserService _userService;

  late List<User> _userList;
  late User _user;

  List<User> get userList => _userList;
  User get user => _user;

  IndexViewModel() {
    _userService = UserService();
  }

  void getUserList() {
    _userList = _userService.getUserList() as List<User>;
    notifyListeners();
  }

  void getUserInfo(String userId) {
    _user = _userService.getUserInfo(userId) as User;
    notifyListeners();
  }
}
