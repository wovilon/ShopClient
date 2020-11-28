import 'package:flutter/material.dart';
import 'package:shop_client/model/AppState.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<AppState>();
    return Scaffold(
      body: Container(color: Colors.lightGreenAccent,
        child: Text('list of items from firebase'),

      ),
    );
  }
}
