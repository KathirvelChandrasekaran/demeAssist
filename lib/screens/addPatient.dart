import 'package:demeassist/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String name = '';
  String gender = 'Male';
  int age = 0;
  int mobile = 0;
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
          "Add Patient",
          style: TextStyle(
            color: primaryViolet,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 2,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.10,
                          right: MediaQuery.of(context).size.width * 0.10,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Patient Name",
                            icon: FaIcon(
                              FontAwesomeIcons.user,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.10,
                          right: MediaQuery.of(context).size.width * 0.10,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            setState(() {
                              age = int.parse(val);
                            });
                          },
                          controller: _ageController,
                          decoration: InputDecoration(
                            labelText: "Age",
                            icon: FaIcon(
                              FontAwesomeIcons.birthdayCake,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.10,
                          right: MediaQuery.of(context).size.width * 0.10,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            setState(() {
                              age = int.parse(val);
                            });
                          },
                          controller: _mobileController,
                          decoration: InputDecoration(
                            labelText: "Mobile",
                            icon: FaIcon(
                              FontAwesomeIcons.phone,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.20,
                          right: MediaQuery.of(context).size.width * 0.10,
                        ),
                        child: DropdownButtonFormField(
                          focusColor: Colors.grey[200],
                          value: gender,
                          items: [
                            DropdownMenuItem(
                              child: Text("Male"),
                              value: "Male",
                            ),
                            DropdownMenuItem(
                              child: Text("Female"),
                              value: "Female",
                            ),
                            DropdownMenuItem(
                              child: Text("Others"),
                              value: "Others",
                            ),
                          ],
                          onChanged: (val) {
                            setState(() {
                              gender = val;
                            });
                          },
                          // hint: Text("Select the gender"),
                          elevation: 2,
                          isDense: true,
                          iconSize: 40.0,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {},
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                color: primaryViolet,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "ADD PATIENT",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
