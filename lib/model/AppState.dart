
import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier{

  void signUp(){

    notifyListeners();
  }

  String localPing(){
    return 'local ping success';
  }


}