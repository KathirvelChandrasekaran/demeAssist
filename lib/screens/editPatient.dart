import 'package:demeassist/utils/colors.dart';
import 'package:flutter/material.dart';

class EditPatient extends StatefulWidget {
  String patientName, gender, imageURL;
  int mobile, age;

  EditPatient(
      {this.patientName, this.gender, this.imageURL, this.mobile, this.age});
  @override
  _EditPatientState createState() => _EditPatientState();
}

class _EditPatientState extends State<EditPatient> {
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
          "EDIT PATIENT",
          style: TextStyle(
            color: primaryViolet,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Text(widget.patientName),
    );
  }
}
