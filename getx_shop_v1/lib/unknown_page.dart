import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);
  static String routeName = '/unknown';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('خطای 404!')),
    );
  }
}
