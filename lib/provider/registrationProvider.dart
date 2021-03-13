import 'package:flutter/cupertino.dart';
import 'package:quizz_app/services/services.dart';

class RegistrationProvider with ChangeNotifier {
  bool loading = false;
  static const String url = "https://quizapp1234.herokuapp.com/user";
  String errorMessage;
  var response;

  Future<bool> register(user, password) async {
    setLogin(true);

    try {
      response =
          await Service(url: url, user: user, password: password).register();
      switch (response.statusCode) {
        case 200:
          setMessage('registered');
          return true;
          break;
        case 400:
          setMessage('Email in use');
          return false;
          break;
        case 500:
          setMessage('no internet connection');
          break;
        default:
      }
    } catch (e) {
      setMessage(e);
      return false;
    }
    return isRegistered();
  }

  void setLogin(value) {
    loading = value;
    notifyListeners();
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  bool isRegistered() {
    return response != null ? true : false;
  }

  String getMessage() {
    return errorMessage;
  }

  bool getLoading() {
    return loading;
  }
}
