import 'package:chatgpt/constants/constant.dart';
import 'package:flutter/material.dart';

class DropDownModel extends StatefulWidget {
  const DropDownModel({super.key});

  @override
  State<DropDownModel> createState() => _DropDownModelState();
}

class _DropDownModelState extends State<DropDownModel> {
  String currentModels = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: getModelsItem,
      dropdownColor: scaffoldBackgroundColor,
      iconEnabledColor: Colors.white,
      value: currentModels,
      onChanged: (value) {setState(() {
      currentModels = value.toString();
    });},
    );
  }
}