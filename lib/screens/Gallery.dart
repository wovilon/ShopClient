import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_client/model/AppState.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return Scaffold(
      body: SafeArea(
        child: Container(color: Colors.lightGreenAccent,
          child:
            _buildBody(context)

        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('baby').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return Text(snapshot.data.documents[0].data.toString());
      },
    );
  }
}
