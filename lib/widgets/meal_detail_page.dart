import 'package:flutter/material.dart';
import '/models/meal_model.dart';
import '/widgets/components/youtube_video.dart';

class MealDetailPage extends StatefulWidget {
  final Meal meal;

  MealDetailPage({required this.meal});

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.strMeal ?? ''),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                color: isFavorite ? Color(0xFFDD1112) : null,
                size: 40,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        top: true,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: YouTubeVideo(
                  videoUrl: widget.meal.strYoutube ?? '',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  'Ingredient',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            if (widget.meal.strIngredient1 != null &&
                widget.meal.strIngredient1 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient1, widget.meal.strMeasure1),
            if (widget.meal.strIngredient2 != null &&
                widget.meal.strIngredient2 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient2, widget.meal.strMeasure2),
            if (widget.meal.strIngredient3 != null &&
                widget.meal.strIngredient3 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient3, widget.meal.strMeasure3),
            if (widget.meal.strIngredient4 != null &&
                widget.meal.strIngredient4 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient4, widget.meal.strMeasure4),
            if (widget.meal.strIngredient5 != null &&
                widget.meal.strIngredient5 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient5, widget.meal.strMeasure5),
            if (widget.meal.strIngredient6 != null &&
                widget.meal.strIngredient6 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient6, widget.meal.strMeasure6),
            if (widget.meal.strIngredient7 != null &&
                widget.meal.strIngredient7 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient7, widget.meal.strMeasure7),
            if (widget.meal.strIngredient8 != null &&
                widget.meal.strIngredient8 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient8, widget.meal.strMeasure8),
            if (widget.meal.strIngredient9 != null &&
                widget.meal.strIngredient9 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient9, widget.meal.strMeasure9),
            if (widget.meal.strIngredient10 != null &&
                widget.meal.strIngredient10 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient10, widget.meal.strMeasure10),
            if (widget.meal.strIngredient11 != null &&
                widget.meal.strIngredient11 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient11, widget.meal.strMeasure11),
            if (widget.meal.strIngredient12 != null &&
                widget.meal.strIngredient12 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient12, widget.meal.strMeasure12),
            if (widget.meal.strIngredient13 != null &&
                widget.meal.strIngredient13 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient13, widget.meal.strMeasure13),
            if (widget.meal.strIngredient14 != null &&
                widget.meal.strIngredient14 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient14, widget.meal.strMeasure14),
            if (widget.meal.strIngredient15 != null &&
                widget.meal.strIngredient15 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient15, widget.meal.strMeasure15),
            if (widget.meal.strIngredient16 != null &&
                widget.meal.strIngredient16 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient16, widget.meal.strMeasure16),
            if (widget.meal.strIngredient17 != null &&
                widget.meal.strIngredient17 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient17, widget.meal.strMeasure17),
            if (widget.meal.strIngredient18 != null &&
                widget.meal.strIngredient18 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient18, widget.meal.strMeasure18),
            if (widget.meal.strIngredient19 != null &&
                widget.meal.strIngredient19 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient19, widget.meal.strMeasure19),
            if (widget.meal.strIngredient20 != null &&
                widget.meal.strIngredient20 != "")
              _buildIngredientWidget(
                  widget.meal.strIngredient20, widget.meal.strMeasure20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  'How to make',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  widget.meal.strInstructions ?? '',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientWidget(String? ingredient, String? measure) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
          child: Text(
            '$ingredient : ${measure ?? ""}',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(
            color: Colors.black,
            height: 20,
            thickness: 1.5,
            indent: 10,
            endIndent: 10,
          ),
        ),
      ],
    );
  }
}