import 'package:wasseoyo/data/models/user.dart';
import 'package:wasseoyo/data/repositories/user_repository.dart';

class UserService {
  final UserRepository _userRepository = UserRepository();

  Future<List<User>> getUserList() {
    return _userRepository.getUserList();
  }

  Future<User> getUserInfo(String userId) {
    return _userRepository.getUserInfo(userId);
  }

  Future<User> login(String userId, String password) {
    return _userRepository.login(userId, password);
  }

  Future<User> changePassword(String userId, String password) {
    return _userRepository.changePassword(userId, password);
  }
}
