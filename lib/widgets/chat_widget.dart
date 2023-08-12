import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key, 
    required this.msg,
    required this.chatIndex});

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Image.asset(
                chatIndex == 0 ? AssestsManager.userImage : AssestsManager.openaiImage,
                height: 40,
                width: 40,
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextWidget(
                    label: msg
                    ),
                ),
                
                chatIndex == 0 ? const SizedBox.shrink()
                : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Icon(Icons.thumb_up_alt_outlined, color: Colors.white,),
                  SizedBox(width: 10,),
                  Icon(Icons.thumb_down_alt_outlined, color: Colors.white,),
                ],)
            ],
            ),
          ),
        )
      ],
    );
  }
}