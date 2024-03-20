import 'package:flutter/material.dart';

class MostViewed extends StatelessWidget {
  const MostViewed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MostViewed'),),
        body: Center(child: Text('List of most wateched Videos'),));
  }
}
