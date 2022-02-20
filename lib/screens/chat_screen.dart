import 'package:chat_app_testing_project/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

late User loggedInUser;

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  static const String id = "CHAT_SCREEN";

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  late String messageText;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser!;
      loggedInUser = user;
      print(loggedInUser.email);
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
              onPressed: () {
                // logout
              },
              icon: const Icon(Icons.close)),
        ],
        title: const Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MessageStream(),
          Container(
            decoration: kMessageContainerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _firestore.collection('messages').add(
                        {'sender': loggedInUser.email, 'text': messageText});
                  },
                  child: const Text(
                    'send',
                    style: kSendButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        }

        final messages = snapshot.data!.docs;
        List<Text> messageWidgets = [];
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];

          final messageWidget = Text('$messageText from $messageSender');
          messageWidgets.add(messageWidget);
        }
        return Expanded(
            child: ListView(
          children: messageWidgets,
        ));
      },
    );
  }
}
