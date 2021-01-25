import 'package:demeassist/screens/wrapper.dart';
import 'package:demeassist/service/authService.dart';
import 'package:demeassist/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      iconTheme: IconThemeData(
        color: primaryViolet,
      ),
      backgroundColor: Colors.white10,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "HOME",
        style: TextStyle(
          color: primaryViolet,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          letterSpacing: 2,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            await authService.signOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Wrapper(),
              ),
            );
          },
          tooltip: "Logout",
          icon: FaIcon(FontAwesomeIcons.signOutAlt),
        )
      ],
    ));
  }
}
