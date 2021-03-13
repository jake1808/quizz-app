import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  String url = "https://quizapp1234.herokuapp.com/";
  final String user;
  final String password;

  Service({this.password, this.user, this.url});

  Future<http.Response> logIn() {
    print(user);
    print(password);
    return http.get(url + "user?posta=" + user + "&sifre=" + password);
  }

  Future<http.Response> fetchCatergory() async {
    return await http.get(url);
  }

  Future<http.Response> register() async {
    return await http.post('$url',
        body: jsonEncode(<String, String>{'posta': user, 'sifre': password}));
  }
}
