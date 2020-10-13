import 'package:flutter/services.dart';
import 'dart:convert';

class JsonHelper {
  String jsonPath;
  List<dynamic> decodedJsonArray;

  //constructor with empty body
  JsonHelper(this.jsonPath);

  // Future<String> loadAsset() async {
  //   return await rootBundle.loadString(jsonPath);
  // }
  //
  // List<dynamic> getJsonArray(){
  //   loadAsset().then((value) {
  //     //decodedJsonArray = json.decode(value);
  //     //print(value.toString()+'value');
  //     decodedJsonArray = jsonDecode(value)['array'];
  //     print(decodedJsonArray.toString()+'decoded Json array');
  //     return decodedJsonArray;
  //   });
  // }

  Future<List<dynamic>> getJsonArray() async{
    String jsonString = await rootBundle.loadString(jsonPath);

    decodedJsonArray = jsonDecode(jsonString)['array'];
    //print(decodedJsonArray.toString()+'decoded Json array');
    return decodedJsonArray;
}

  // Future<String> loadAsset() async {
  //   return await rootBundle.loadString(jsonPath);
  // }
  //
  // List<dynamic> getJsonArray(){
  //   loadAsset().then((value) {
  //     //decodedJsonArray = json.decode(value);
  //     //print(value.toString()+'value');
  //     decodedJsonArray = jsonDecode(value)['array'];
  //     print(decodedJsonArray.toString()+'decoded Json array');
  //     return decodedJsonArray;
  //   });
  // }

}