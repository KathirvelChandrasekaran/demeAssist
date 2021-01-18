import 'package:demeassist/screens/auth.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/logo.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 40,
                      top: 70,
                      child: Text(
                        "bbooks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Your book shelf",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Opacity(
                opacity: 0.5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Text(
                    "Create your account and start adding the books.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Authentication()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
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
