import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chatgpt/.env.dart';


import 'package:chatgpt/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  static Future<List<ModelsModel>> getModels() async{
    try{
      var response =await http.get(Uri.parse("$BASE_URL/models"),
      headers: {
        'Authorization': "Bearer $API_KEY"
      }
      );
      Map jsonResponse = jsonDecode(response.body);

      if(jsonResponse['error'] != null){
        // print("jsonResponse['error']" "${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      // print(jsonResponse);
      List temp =[];
      for(var value in jsonResponse['data']){
        temp.add(value);
        log("temp $value");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    }
    catch(error){
      print('Error in ApiService.getModels():');
      print(error);
      rethrow;
    }
  }
}