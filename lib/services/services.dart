import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/widgets/drop_down.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async{
    await showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0),
                                )
                              ),
                              backgroundColor: scaffoldBackgroundColor,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                            child: TextWidget(
                                          label: "Choose Model: ",
                                          fontSize: 16,
                                        )
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: DropDownModel()
                                          )
                                      ],
                                    ),
                                  );
                                });
  }
}