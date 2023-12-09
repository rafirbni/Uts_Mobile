import 'dart:convert';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RecipeApi {
  Future<Map> getDatasCategory() async {
    Response response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    Map datasResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(datasResult);
      return datasResult;
    } else {
      print("Error: " + response.statusCode.toString());
      return datasResult;
    }
  }

  Future<Map> getDatasdtlCategory(String category) async {
    Response response = await http.get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category"));
    Map datasResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(datasResult);
      return datasResult;
    } else {
      print("Error: " + response.statusCode.toString());
      return datasResult;
    }
  }

  Future<Map> getDatasDetail(String detail) async {
    Response response = await http.get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/search.php?s=$detail"));
    Map datasResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(datasResult);
      return datasResult;
    } else {
      print("Error: " + response.statusCode.toString());
      return datasResult;
    }
  }

  Future<Map> getDatasPopular() async {
    Response response = await http
        .get(Uri.parse("https://www.themealdb.com/api/json/v1/1/random.php"));
    Map datasResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(datasResult);
      return datasResult;
    } else {
      print("Error: " + response.statusCode.toString());
      return datasResult;
    }
  }
}
