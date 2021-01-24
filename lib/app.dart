import 'package:demeassist/screens/wrapper.dart';
import 'package:demeassist/utils/colors.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryViolet,
        ),
        home: Wrapper(),
      ),
    );
  }
}
