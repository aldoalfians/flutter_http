import "dart:convert";

import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  late Uri url;

  connectAPI(String name, String job) async {
    url = Uri.parse("https://reqres.in/api/users");

    var res = await http.post(url, body: {"name": name, "job": job});

    _data = json.decode(res.body);
    notifyListeners();
  }

  connectGetAPI(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/$id");

    var res = await http.get(url);

    if (res.statusCode == 200) {
      _data = (json.decode(res.body))["data"];
      notifyListeners();
      // ignore: use_build_context_synchronously
      handlingStatusCode(context, "BERHASIL GET DATA");
    } else {
      // ignore: use_build_context_synchronously
      handlingStatusCode(context, "ERROR ${res.statusCode}");
    }
  }

  void deleteData(BuildContext context) async {
    var hasilResponse = await http.delete(url);

    print(hasilResponse.statusCode);

    if (hasilResponse.statusCode == 204) {
      _data = {};
      notifyListeners();
      handlingStatusCode(context, "No content !");
    }
  }

  handlingStatusCode(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 700),
      ),
    );
  }
}
