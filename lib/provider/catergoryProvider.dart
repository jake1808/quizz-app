import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:quizz_app/models/catergory.dart';
import 'package:quizz_app/services/services.dart';

class CatergoryProvider with ChangeNotifier {
  List<Catergory> catergory;
  String errorMessage;
  bool loading = false;

  Future<bool> fetchCatergory() async {
    setLoading(true);

    await Service(url: "https://quizapp1234.herokuapp.com/kategori")
        .fetchCatergory()
        .then((data) {
      if (data.statusCode == 200) {
        setCatergory(Catergory.fromJson(json.decode(data.body)));
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });

    return isList();
  }

  bool isLoading() {
    return loading;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setCatergory(value) {
    catergory = value;
    notifyListeners();
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  List<Catergory> getList() {
    return catergory;
  }

  String getMessage() {
    return errorMessage;
  }

  bool isList() {
    return catergory != null ? true : false;
  }
}
