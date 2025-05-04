import 'package:flutter/material.dart';
import 'dart:async';

class DownloadScreen extends StatefulWidget {
  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final List<Map<String, String>> apps = List.generate(
    6,
    (index) => {
      "name": "App ${index + 1}",
      "description": "Lorem ipsum ...",
    },
  );

  List<double> downloadProgress = List.filled(6, 0.0);
  List<bool> isDownloaded = List.filled(6, false);
  List<Timer?> timers = List.filled(6, null);

  void startDownload(int index) {
    if (downloadProgress[index] > 0 || isDownloaded[index]) return;

    timers[index]?.cancel(); // cancel previous timer if any

    timers[index] = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        downloadProgress[index] += 0.05;
        if (downloadProgress[index] >= 1.0) {
          downloadProgress[index] = 1.0;
          isDownloaded[index] = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    for (var timer in timers) {
      timer?.cancel();
    }
    super.dispose();
  }

  Widget buildTrailing(int index) {
    if (isDownloaded[index]) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "OPEN",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (downloadProgress[index] > 0) {
      return SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          value: downloadProgress[index],
          strokeWidth: 2.5,
          color: Colors.blue,
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => startDownload(index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    }
  }

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
            trailing: buildTrailing(index),
          );
        },
      ),
    );
  }
}
