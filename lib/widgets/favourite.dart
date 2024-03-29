import 'package:flutter/material.dart';
import 'package:food_recipe/models/api_services.dart';
import '/models/database.dart';
import 'meal_detail_page.dart';
import 'components/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late Future<List<MealDB>> _mealsFuture;
  late String _userEmail;

  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  void updateMealsFuture() {
    setState(() {
      _mealsFuture = Favourite.getMeals(_userEmail);
    });
  }

  Future<void> _initializePage() async {
    _userEmail = await _getUserEmail();

    final allMeals = await Favourite.getAllMeals();
    if (allMeals.isNotEmpty) {
      for (final meal in allMeals) {
        print('Meal: ${meal.meal_name}, User: ${meal.user_email}');
      }
    } else {
      print('Cơ sở dữ liệu trống.');
    }

    setState(() {
      _mealsFuture = Favourite.getMeals(_userEmail);
    });
  }

  Future<String> _getUserEmail() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.email != null) {
      return currentUser.email!;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<MealDB>>(
          future: _mealsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No users yet.');
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 70, 10, 0),
                    child: Text(
                      'Favorite',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final meal = snapshot.data![index];
                        return FutureBuilder(
                          future: fetchMealDetails(meal.meal_name.replaceAll(' ', '_').trim()),
                          builder: (context, mealDetailsSnapshot) {
                            if (mealDetailsSnapshot.connectionState == ConnectionState.waiting) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: CircularProgressIndicator(),
                              );
                            } else if (mealDetailsSnapshot.hasError) {
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Error: ${mealDetailsSnapshot.error}'),
                              );
                            } else {
                              final mealDetails = mealDetailsSnapshot.data;
                              return GestureDetector(
                                onTap: () {
                                  fetchMeals(mealDetails?.strMeal ?? '').then((meals) {
                                    if (meals.isNotEmpty) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MealDetailPage(meal: meals[0], toggleFavorite: updateMealsFuture),
                                        ),
                                      );
                                    } else {
                                      // Handle when meals is empty
                                    }
                                  }).catchError((error) {
                                    // Handle error
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    width: 260,
                                    height: 175,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          mealDetails?.strMealThumb ?? '',
                                        ),
                                        onError: (exception, stackTrace) => NetworkImage('https://www.themealdb.com/images/media/meals/xrrtss1511555269.jpg'),
                                      ),
                                    ),
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        mealDetails?.strMeal ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Set the current index as needed
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/search');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/favourite');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/setting');
          }
        },
      ),
    );
  }
}
