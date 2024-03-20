import 'package:flutter/material.dart';

class PlayLists extends StatelessWidget {
  const PlayLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PLay List'),
        ),
        body: Center(
          child: Text('List of most wateched Videos'),
        ));
  }
}
