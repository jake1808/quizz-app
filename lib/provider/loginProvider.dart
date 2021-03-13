import 'package:flutter/cupertino.dart';
import 'package:quizz_app/models/user.dart';
import 'package:quizz_app/services/services.dart';

class LoginProvider with ChangeNotifier {
  UserInfo user;
  String errorMessage;
  bool loading = false;

  Future<bool> logIn(username, password) async {
    setLoading(true);
    try {
      var response = await Service(
              url: "https://quizapp1234.herokuapp.com/",
              user: username,
              password: password)
          .logIn();
      switch (response.statusCode) {
        case 200:
          setLoading(false);
          return true;
          break;
        case 400:
          setLoading(false);
          setMessage("Unauthorized login");
          return false;
          break;
        case 500:
          setLoading(false);
          setMessage("Server error");
          return false;
          break;
        default:
      }
    } catch (e) {
      print(e);
      setMessage(e);
      return false;
    }
    return false;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  bool getLoading() {
    return loading;
  }
}
