import 'package:flutter/material.dart';
import 'package:flutter_http/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("POST - PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<HttpProvider>(
              builder: (context, value, child) => FittedBox(
                child: Text(
                  (value.data["id"] == null)
                      ? "ID : Belum ada data"
                      : "ID : ${value.data["id"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Consumer<HttpProvider>(
              builder: (context, value, child) => FittedBox(
                child: Text(
                  (value.data["name"] == null)
                      ? "Nama : Belum ada data"
                      : "Nama : ${value.data["name"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Consumer<HttpProvider>(
              builder: (context, value, child) => FittedBox(
                child: Text(
                  (value.data["job"] == null)
                      ? "Pekerjaan : Belum ada data"
                      : "Pekerjaan : ${value.data["job"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Consumer<HttpProvider>(
              builder: (context, value, child) => FittedBox(
                child: Text(
                  (value.data["createdAt"] == null)
                      ? "Dibuat : Belum ada data"
                      : "Dibuat : ${value.data["createdAt"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                dataProvider.connectAPI("Aldo", "FrontEnd");
              },
              child: Text(
                "POST DATA",
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
