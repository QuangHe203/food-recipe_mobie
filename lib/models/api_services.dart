import 'dart:convert';
import 'package:http/http.dart' as http;
import 'meal_model.dart';

Future<List<Meal>> fetchMeals(String query) async {
  final response = await http.get(
      Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s=$query"));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> mealsData = data['meals'];

    return mealsData.map((meal) => Meal.fromJson(meal)).toList();
  } else {
    throw Exception('Failed to load meals');
  }
}

class APIServices {
  static Future<List<dynamic>> fetchMealsByIngredient(String ingredient) async {
    final String apiUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredient';
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }
}

