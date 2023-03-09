import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_http/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("GET - PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Consumer<HttpProvider>(
                  builder: (context, value, child) => Image.network(
                    (value.data["avatar"] == null)
                        ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                        : value.data["avatar"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data["id"] == null)
                      ? "ID : Belum ada data"
                      : "ID : ${value.data["id"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data["first_name"] == null ||
                          value.data["last_name"] == null)
                      ? "Belum ada data"
                      : value.data["first_name"] +
                          " " +
                          value.data["last_name"],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data["email"] == null)
                      ? "Belum ada data"
                      : value.data["email"],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                dataProvider
                    .connectGetAPI((1 + Random().nextInt(10)).toString());
              },
              child: Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Post http
// class HomeProvider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final dataProvider = Provider.of<HttpProvider>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("POST - PROVIDER"),
//       ),
//       body: Container(
//         width: double.infinity,
//         margin: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer<HttpProvider>(
//               builder: (context, value, child) => FittedBox(
//                 child: Text(
//                   (value.data["id"] == null)
//                       ? "ID : Belum ada data"
//                       : "ID : ${value.data["id"]}",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Consumer<HttpProvider>(
//               builder: (context, value, child) => FittedBox(
//                 child: Text(
//                   (value.data["name"] == null)
//                       ? "Nama : Belum ada data"
//                       : "Nama : ${value.data["name"]}",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Consumer<HttpProvider>(
//               builder: (context, value, child) => FittedBox(
//                 child: Text(
//                   (value.data["job"] == null)
//                       ? "Pekerjaan : Belum ada data"
//                       : "Pekerjaan : ${value.data["job"]}",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Consumer<HttpProvider>(
//               builder: (context, value, child) => FittedBox(
//                 child: Text(
//                   (value.data["createdAt"] == null)
//                       ? "Dibuat : Belum ada data"
//                       : "Dibuat : ${value.data["createdAt"]}",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             SizedBox(height: 100),
//             OutlinedButton(
//               onPressed: () {
//                 dataProvider.connectAPI("Aldo", "FrontEnd");
//               },
//               child: Text(
//                 "POST DATA",
//                 style: TextStyle(
//                   fontSize: 25,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
