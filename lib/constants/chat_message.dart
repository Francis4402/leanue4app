import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learnue4service/models/message_model.dart';

import 'format_date.dart';

class ChatMessage extends StatefulWidget {
  final MessageModel msg;
  final String currentUser;
  final bool isImage;

  const ChatMessage(
      {super.key,
      required this.msg,
      required this.currentUser,
      required this.isImage});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return widget.isImage
        ? Row(
            mainAxisAlignment: widget.msg.sender == widget.currentUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: widget.msg.sender == widget.currentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(4),
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            imageUrl:
                                "https://res.cloudinary.com/dse9babc4/image/upload/v1739553392/dfafdagd.jpg")),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          formatDate(widget.msg.timestamp),
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.outline),
                        ),
                      ),
                      widget.msg.sender == widget.currentUser
                          ? widget.msg.isSeenByReceiver
                          ? const Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: Colors.greenAccent,
                      )
                          : const Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: Colors.blue,
                      )
                          : const SizedBox()
                    ],
                  )
                ],
              ),
            ],
          )
        : Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: widget.msg.sender == widget.currentUser
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: widget.msg.sender == widget.currentUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75),
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      widget.msg.sender == widget.currentUser
                                          ? const Radius.circular(20)
                                          : const Radius.circular(2),
                                  bottomRight:
                                      widget.msg.sender == widget.currentUser
                                          ? const Radius.circular(2)
                                          : const Radius.circular(20),
                                  topLeft: const Radius.circular(20),
                                  topRight: const Radius.circular(20))),
                          child: Text(widget.msg.message),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            formatDate(widget.msg.timestamp),
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.outline),
                          ),
                        ),
                        widget.msg.sender == widget.currentUser
                            ? widget.msg.isSeenByReceiver
                                ? const Icon(
                                    Icons.check_circle_outline,
                                    size: 16,
                                    color: Colors.greenAccent,
                                  )
                                : const Icon(
                                    Icons.check_circle_outline,
                                    size: 16,
                                    color: Colors.blue,
                                  )
                            : const SizedBox()
                      ],
                    )
                  ],
                )
              ],
            ),
          );
  }
}
