import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  final List<Map<String, String>> apps = List.generate(
    6,
    (index) => {
      "name": "App ${index + 1}",
      "description": "Lorem ipsum ...",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apps'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final app = apps[index];
          return ListTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(Icons.ac_unit, color: Colors.white),
              ),
            ),
            title: Text(app['name']!),
            subtitle: Text(app['description']!),
            trailing: index == 0
                ? Icon(Icons.downloading, color: Colors.blue)
                : Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "GET",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
