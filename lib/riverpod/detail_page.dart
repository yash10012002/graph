import 'package:flutter/material.dart';
import 'package:graph/Graph/app_style.dart';
import 'package:graph/riverpod/model.dart';

class DetailPage extends StatelessWidget {
  final UserModel data;
  const DetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bg_color,
      appBar: AppBar(
        backgroundColor: AppStyle.bg_color,
        title: Text("Details Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(data.avatar!),
                radius: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "${data.firstName} ${data.lastName}",
                style: TextStyle(
                  color: AppStyle.accent_color,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
