import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final userEmail;
  bool _isUser;

  MessageBubble({@required this.text, @required this.sender, this.userEmail}) {
    _isUser = sender == userEmail ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment:
              _isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              sender,
              style: TextStyle(fontSize: 10.0, color: Colors.black54),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Material(
                borderRadius: _isUser
                    ? BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                color: _isUser ? Colors.lightBlueAccent : Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    style: _isUser
                        ? TextStyle(fontSize: 15.0, color: Colors.white)
                        : TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
