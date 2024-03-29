import 'package:flutter/material.dart';
import '/widgets/components/filter_container.dart';
import '/models/api_services.dart';
import '/widgets/meal_detail_page.dart';
import 'components/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String incredient;
  late final List<String> meals = [];
  late List<String> futureData = [];

  List<bool> isCheckedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void initState() {
    super.initState();
    incredient = "chicken_breast";
    fetchStrMeals(incredient).then((value) {
      setState(() {
        futureData = value;
      });
    });
  }

  void toggleChecked(int index, bool newValue, String newIncredient) async {
    setState(() {
      for (int i = 0; i < isCheckedList.length; i++) {
        isCheckedList[i] = (i == index) ? newValue : false;
      }
      incredient = newIncredient;
    });

    try {
      final data = await fetchStrMeals(incredient);
      setState(() {
        futureData = data;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: double.infinity,
                height: 127,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text(
                                          'Chào buổi sáng',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text(
                                          'Lisan-al Gaib',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 20, 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://picsum.photos/seed/100/600',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Container(
                width: double.infinity,
                height: 415,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
                        child: Text(
                          'What do you have in your refrigerator?',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Lime.png',
                              text: 'Lemon',
                              width: 168,
                              isChecked: isCheckedList[0],
                              onToggled: (value) =>
                                  toggleChecked(0, value, 'Lemon'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Chicken.png',
                              text: 'Chicken',
                              width: 175,
                              isChecked: isCheckedList[1],
                              onToggled: (value) =>
                                  toggleChecked(1, value, 'Chicken'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Salmon.png',
                              text: 'Salmon',
                              width: 170,
                              isChecked: isCheckedList[2],
                              onToggled: (value) =>
                                  toggleChecked(2, value, 'Salmon'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Beef.png',
                              text: 'Beef',
                              width: 140,
                              isChecked: isCheckedList[3],
                              onToggled: (value) =>
                                  toggleChecked(3, value, 'Beef'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Pork.png',
                              text: 'Pork',
                              width: 140,
                              isChecked: isCheckedList[4],
                              onToggled: (value) =>
                                  toggleChecked(4, value, 'Pork'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Avocado.png',
                              text: 'Avocado',
                              width: 175,
                              isChecked: isCheckedList[5],
                              onToggled: (value) =>
                                  toggleChecked(5, value, 'Avocado'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Bacon.png',
                              text: 'Bacon',
                              width: 160,
                              isChecked: isCheckedList[6],
                              onToggled: (value) =>
                                  toggleChecked(6, value, 'Bacon'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Aubergine.png',
                              text: 'Aubergine',
                              width: 205,
                              isChecked: isCheckedList[7],
                              onToggled: (value) =>
                                  toggleChecked(7, value, 'Aubergine'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Bread.png',
                              text: 'Bread',
                              width: 155,
                              isChecked: isCheckedList[8],
                              onToggled: (value) =>
                                  toggleChecked(8, value, 'Bread'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Broccoli.png',
                              text: 'Broccoli',
                              width: 175,
                              isChecked: isCheckedList[9],
                              onToggled: (value) =>
                                  toggleChecked(9, value, 'Broccoli'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Butter.png',
                              text: 'Butter',
                              width: 145,
                              isChecked: isCheckedList[10],
                              onToggled: (value) =>
                                  toggleChecked(10, value, 'Butter'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Carrot.png',
                              text: 'Carrot',
                              width: 155,
                              isChecked: isCheckedList[11],
                              onToggled: (value) =>
                                  toggleChecked(11, value, 'Carrot'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Cheese.png',
                              text: 'Cheese',
                              width: 165,
                              isChecked: isCheckedList[12],
                              onToggled: (value) =>
                                  toggleChecked(12, value, 'Cheese'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Cloves.png',
                              text: 'Cloves',
                              width: 165,
                              isChecked: isCheckedList[13],
                              onToggled: (value) =>
                                  toggleChecked(13, value, 'Cloves'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Coriander.png',
                              text: 'Coriander',
                              width: 195,
                              isChecked: isCheckedList[14],
                              onToggled: (value) =>
                                  toggleChecked(14, value, 'Coriander'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Cucumber.png',
                              text: 'Cucumber',
                              width: 195,
                              isChecked: isCheckedList[15],
                              onToggled: (value) =>
                                  toggleChecked(15, value, 'Cucumber'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Eggs.png',
                              text: 'Eggs',
                              width: 145,
                              isChecked: isCheckedList[16],
                              onToggled: (value) =>
                                  toggleChecked(16, value, 'Eggs'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Flour.png',
                              text: 'Flour',
                              width: 135,
                              isChecked: isCheckedList[17],
                              onToggled: (value) =>
                                  toggleChecked(17, value, 'Flour'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Lamb.png',
                              text: 'Lamb',
                              width: 145,
                              isChecked: isCheckedList[18],
                              onToggled: (value) =>
                                  toggleChecked(18, value, 'Lamb'),
                            ),
                            FilterContainer(
                              imageUrl:
                              'https://www.themealdb.com/images/ingredients/Mushrooms.png',
                              text: 'Mushrooms',
                              width: 215,
                              isChecked: isCheckedList[19],
                              onToggled: (value) =>
                                  toggleChecked(19, value, 'Mushrooms'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 10),
                        child: Text(
                          'Món ăn',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final meal in futureData)
                            FutureBuilder(
                              future: fetchMealDetails(meal),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else {
                                  final mealDetails = snapshot.data;
                                  return GestureDetector(
                                    onTap: () {
                                      fetchMeals(mealDetails?.strMeal ?? '').then((meals) {
                                        if (meals.isNotEmpty) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MealDetailPage(meal: meals[0], ),
                                            ),
                                          );
                                        } else {
                                        }
                                      }).catchError((error) {
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
                            ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 500, //350
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                      child: Text(
                        'Khám phá ẩm thực thế giới !!',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 280,
                            height: 350, //300
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFFEE044),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Container(
                                    width: 300,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          'https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxuaWdodCUyMHNreXxlbnwwfHx8fDE3MTA5MDk4OTJ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 0, 5),
                                            child: Text(
                                              'Mỹ',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Colors
                                                    .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                //Thêm các thuộc tính khác nếu cần
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 0, 5),
                                            child: Text(
                                              '400 món',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Colors
                                                    .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                //Thêm các thuộc tính khác nếu cần
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors
                                              .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Container(
                            width: 280,
                            height: 350, //300
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFFEE044),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Container(
                                    width: 300,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          'https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxuaWdodCUyMHNreXxlbnwwfHx8fDE3MTA5MDk4OTJ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 0, 5),
                                            child: Text(
                                              'Mỹ',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Colors
                                                    .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                //Thêm các thuộc tính khác nếu cần
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 0, 5),
                                            child: Text(
                                              '400 món',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Colors
                                                    .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                //Thêm các thuộc tính khác nếu cần
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Container(
                            width: 280,
                            height: 350, //300
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFFEE044),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Container(
                                    width: 300,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          'https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxuaWdodCUyMHNreXxlbnwwfHx8fDE3MTA5MDk4OTJ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 0, 5),
                                            child: Text(
                                              'Mỹ',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Colors
                                                    .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                //Thêm các thuộc tính khác nếu cần
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 0, 5),
                                            child: Text(
                                              '400 món',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                color: Colors
                                                    .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                //Thêm các thuộc tính khác nếu cần
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 134,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/862/600',
                                                width: 110,
                                                height: 67,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 110,
                                              height: 64,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFEE044),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                  Radius.circular(8),
                                                  bottomRight:
                                                  Radius.circular(8),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Text(
                                                  'Hamburger',
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    color: Colors
                                                        .white, // Sử dụng màu secondaryBackground từ Colors hoặc thay bằng một màu khác nếu cần
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    //Thêm các thuộc tính khác nếu cần
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Set the current index as needed
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
