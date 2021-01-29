import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  ErrorBox({this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Icon(Icons.error_outline, color: Colors.white,),
          SizedBox(width: 16,),
          Expanded(
            child: Text(
              "Ooops! $message. Favor verificar",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
