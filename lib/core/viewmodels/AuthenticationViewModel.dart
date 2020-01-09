import 'package:flutter/foundation.dart';

class AuthenticationViewModel with ChangeNotifier {
  bool isUserLoggedIn = false;

  bool loginUser(String userName, String password) {
    if (userName.trim().toLowerCase() == 'rohan' &&
        password.trim().toLowerCase() == 'rohan') {
      isUserLoggedIn = true;
      notifyListeners();
      return true;
    } else {
      isUserLoggedIn = false;
      notifyListeners();
      return false;
    }
  }

  void logOutUser() {
    isUserLoggedIn = false;
    notifyListeners();
  }
}
