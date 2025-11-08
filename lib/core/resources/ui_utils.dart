import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class UIUtils{
  static void showLoading(BuildContext context,[ bool dismissible = true]){
    showDialog(
      barrierDismissible: dismissible,
        context: context,
        builder: (context)=> PopScope(
          canPop: dismissible,
          child: AlertDialog(content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
          CircularProgressIndicator()
                ],
              ),),
        ));
  }


  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }
  static void showToastMessage(String message, Color bgColor){
    Fluttertoast.showToast(
        msg:message,

        gravity: ToastGravity.BOTTOM,

        backgroundColor:bgColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}