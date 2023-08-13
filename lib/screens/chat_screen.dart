import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/widgets/chat_widget.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = true;

  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssestsManager.openaiImage),
          ),
          title: const Text('Vox'),
          actions: [
            IconButton(
              onPressed: () async {
                            await showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: scaffoldBackgroundColor,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                            child: TextWidget(
                                          label: "Choose Model: ",
                                          fontSize: 16,
                                        )),
                                      ],
                                    ),
                                  );
                                });
                          },
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        msg: chatMessages[index]['msg'].toString(),
                        chatIndex: int.parse(
                            chatMessages[index]['chatIndex'].toString()),
                      );
                    }),
              ),
              if (_isTyping) ...[
                SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(
                  height: 15,
                ),
                Material(
                  color: cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.grey),
                            controller: textEditingController,
                            onSubmitted: (value) {
                              //TODO: Send message to the server
                            },
                            decoration: InputDecoration(
                              hintText: 'How can I help you?',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(8.0),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]
            ],
          ),
        ));
  }
}
