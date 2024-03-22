import 'package:flutter/material.dart';

class ChannelList extends StatelessWidget {
  const ChannelList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Channel List'),),
        body: Center(child: Text('List of most wateched Videos'),));
  }
}
