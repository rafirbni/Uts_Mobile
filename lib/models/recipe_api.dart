import 'dart:convert';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RecipeApi {
  List mealRecipes = [];
  Future<void> getDatas() async {
    Response response = await http
        .get(Uri.parse("www.themealdb.com/api/json/v1/1/search.php?f=b"));
    Map datasResult = jsonDecode(response.body);
    print(datasResult.isEmpty);
  }
}
