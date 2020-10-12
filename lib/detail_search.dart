import 'package:flutter/material.dart';

class DetailList extends StatelessWidget {
  final detail;

  DetailList({this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Search")),
      body: Center(
        child: Text(detail),
      ),
    );
  }
}
