import "dart:convert";

import "package:http/http.dart" as http;

class HttpStateful {
  String? id, name, job, fullname, email, createdAt, avatar;

  HttpStateful(
      {this.createdAt,
      this.id,
      this.fullname,
      this.email,
      this.name,
      this.job,
      this.avatar});

  // Post
  static Future<HttpStateful> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var res = await http.post(url, body: {"name": name, "job": job});

    var data = json.decode(res.body);

    return HttpStateful(
      id: data["id"],
      name: data["name"],
      job: data["job"],
      createdAt: data["createdAt"],
    );
  }

  // Get
  static Future<HttpStateful> connectAPIGet(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");

    var res = await http.get(url);

    var data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    return HttpStateful(
        id: data["id"].toString(),
        fullname: data["first_name"] + " " + data["last_name"],
        email: data["email"],
        avatar: data["avatar"]);
  }
}
