import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of items from FireStore'),
        backgroundColor: Colors.green,
      ),
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
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, i){
            return ListTile(
              title: Text(snapshot.data.documents[i].data.toString()),
            );
          },
        );


        //return Text(snapshot.data.documents[i].data.toString());
      },
    );
  }
}
