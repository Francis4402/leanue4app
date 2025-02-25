import 'package:flutter/material.dart';
import 'package:learnue4service/constants/chat_message.dart';
import 'package:learnue4service/models/message_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();

  List messages = [
    MessageModel(
        message: "Hello",
        sender: "101",
        receiver: "202",
        timestamp: DateTime(2025, 2, 22),
        isSeenByReceiver: false),
    MessageModel(
        message: "hi",
        sender: "202",
        receiver: "101",
        timestamp: DateTime(2025, 2, 22),
        isSeenByReceiver: false),
    MessageModel(
        message: "Vhai Game Khalbo",
        sender: "101",
        receiver: "202",
        timestamp: DateTime(2025, 2, 22),
        isSeenByReceiver: false),
    MessageModel(
        message: "Ki Game",
        sender: "202",
        receiver: "101",
        timestamp: DateTime(2025, 2, 22),
        isSeenByReceiver: false),
    MessageModel(
        message: "freefire",
        sender: "101",
        receiver: "202",
        timestamp: DateTime(2025, 2, 22),
        isSeenByReceiver: true),
    MessageModel(
        message: "This One",
        sender: "202",
        receiver: "101",
        timestamp: DateTime(2025, 2, 22),
        isSeenByReceiver: true,
        isImage: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Row(
        children: [
          CircleAvatar(),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("User Name"),
              Text(
                'Online',
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      )),
      body: Column(
        children: [
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) => ChatMessage(
                      msg: messages[index], currentUser: "101", isImage: true),
                )),
          ),
          Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Type a message.."),
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.send)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
