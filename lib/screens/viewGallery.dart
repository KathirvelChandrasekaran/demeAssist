import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demeassist/screens/chewieListItem.dart';
import 'package:demeassist/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class ViewGallery extends StatefulWidget {
  String email;
  ViewGallery({this.email});
  @override
  _ViewGalleryState createState() => _ViewGalleryState();
}

class _ViewGalleryState extends State<ViewGallery> {
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
          "Gallery".toUpperCase(),
          style: TextStyle(
            color: primaryViolet,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 2,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("VideoURL")
            .doc(widget.email)
            .collection("URL")
            .where("uid", isEqualTo: FirebaseAuth.instance.currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: SpinKitCubeGrid(
                color: primaryViolet,
              ),
            );
          else
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot urls = snapshot.data.documents[index];
                  print(urls['videoURL']);
                  return Container(
                    child: ChewieListItem(
                      videoPlayerController: VideoPlayerController.network(
                        urls['videoURL'],
                      ),
                    ),
                  );
                });
        },
      ),
    );
  }
}
