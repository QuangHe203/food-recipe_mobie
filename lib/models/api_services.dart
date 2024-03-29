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

Future<Meal?> fetchMealDetails(String mealName) async {
  final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$mealName');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> meals = data['meals'];

    if (meals != null && meals.isNotEmpty) {
      return Meal.fromJson(meals[0]);
    } else {
      print('No meal found with the name: $mealName');
      return null;
    }
  } else {
    print('Failed to load meal details: ${response.statusCode}');
    return null;
  }
}

Future<List<String>> fetchStrMeals(String ingredient) async {
  final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredient');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);

    final List<dynamic> meals = data['meals'];
    List<String> mealNames = [];
    meals.forEach((meal) {
      String name = meal['strMeal'].toString();
      name = name.replaceAll(' ', '_');
      name = name.trim();
      mealNames.add(name);
    });
    return mealNames;
  } else {
    print('Failed to load meals: ${response.statusCode}');
    return [];
  }
}

