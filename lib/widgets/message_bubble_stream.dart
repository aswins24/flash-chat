import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageBubbleStream extends StatelessWidget {
  final Firestore firestore;
  final currentUser;

  MessageBubbleStream({@required this.firestore, @required this.currentUser});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Colors.blue,
            );
          } else {
            final messages = snapshot.data.documents.reversed;
            List<Widget> messageBubble = [];

            for (var message in messages) {
              final textmessage = message.data['message'];
              final textSender = message.data['sender'];

              final bubble = MessageBubble(
                text: textmessage,
                sender: textSender,
                userEmail: currentUser,
              );
              messageBubble.add(bubble);
            }
            return ListView(
              reverse: true,
              children: messageBubble,
            );
          }
        });
  }
}
