import 'package:flutter/material.dart';


class ErrorPopup extends StatelessWidget {

  ErrorPopup({this.message});
  final String message;


  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(

      child: Container(

        child: AlertDialog(
          title: Text("Ooops!"),
          content: Text(" $message."),
          actions: <Widget>[
            FlatButton(
              child: Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          elevation: 24.0,
          backgroundColor: Colors.white,

        ),
      ),
    );


  }
}
