import 'package:flutter/material.dart';
import 'package:responsive/utils/constants.dart';

class NotFoundPage extends StatelessWidget {
  static const routeName = '/not-found';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
        child: Text(
          'Not Found!',
          style: TextStyle(
            fontSize: 36.0,
            color: colorPrimary,
            letterSpacing: 2.4,
          ),
        ),
      ),
    );
  }
}
