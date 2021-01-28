import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demeassist/screens/editPatient.dart';
import 'package:demeassist/screens/wrapper.dart';
import 'package:demeassist/service/authService.dart';
import 'package:demeassist/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService authService = AuthService();

  final _user = FirebaseFirestore.instance;

  String uid = FirebaseAuth.instance.currentUser.uid;

  bool found = false;

  Future<bool> patientFound() async {
    DocumentReference documentReference =
        _user.collection('User').doc(uid).collection('PatientDetails').doc();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists)
        setState(() {
          this.found = true;
        });
      else
        setState(() {
          this.found = false;
        });
    });
    return this.found;
  }

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
      ),
      body: !found
          ? StreamBuilder(
              stream: _user
                  .collection('User')
                  .doc(uid)
                  .collection("PatientDetails")
                  .snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot patienDetails =
                        snapshot.data.documents[index];
                    String _id = patienDetails.id;
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditPatient(
                                age: patienDetails['age'],
                                gender: patienDetails['gender'],
                                imageURL: patienDetails['imageURL'],
                                mobile: patienDetails['mobile'],
                                patientName: patienDetails['patientName'],
                                docID: _id,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          elevation: 8,
                          margin: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.06),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              margin: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: CircleAvatar(
                                          maxRadius: 60,
                                          backgroundImage: NetworkImage(
                                              patienDetails['imageURL']),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                patienDetails['patientName'],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            patienDetails['mobile'].toString(),
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            patienDetails['age'].toString(),
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            patienDetails['gender'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Text("Please add patient details."),
      floatingActionButton: Tooltip(
        message: "Add Patient",
        verticalOffset: 40,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed((context), '/addPatient');
          },
          child: FaIcon(
            FontAwesomeIcons.plus,
          ),
          backgroundColor: primaryViolet,
        ),
      ),
    );
  }
}
