import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demeassist/service/authService.dart';
import 'package:demeassist/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatelessWidget {
  final AuthService authService = AuthService();
  final _user = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser.uid;

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
          "PROFILE",
          style: TextStyle(
            color: primaryViolet,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 2,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _user
            .collection('User')
            .doc(uid)
            .collection('UserDetails')
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot userDetails = snapshot.data.documents[index];
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(userDetails['imageURL']),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        userDetails['userName'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        userDetails['age'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        userDetails['gender'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        userDetails['mobile'].toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      FirebaseAuth.instance.currentUser.emailVerified
                          ? Container(
                              child: Text(
                                'Email Verified',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ButtonTheme(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: RaisedButton.icon(
                                  icon: FaIcon(
                                    FontAwesomeIcons.telegram,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/resendMail');
                                  },
                                  label: Text(
                                    "Send another email",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                    ),
                                  ),
                                  color: primaryViolet,
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
