import 'package:flutter/services.dart';
import 'dart:convert';

class JsonHelper {
  String jsonPath;
  List<dynamic> decodedJsonArray;

  //constructor with empty body
  JsonHelper(this.jsonPath);

  Future<List<dynamic>> getJsonArray() async{
    String jsonString = await rootBundle.loadString(jsonPath);

    decodedJsonArray = jsonDecode(jsonString)['array'];
    return decodedJsonArray;
  }
}