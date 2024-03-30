import 'package:flutter/material.dart';
import 'widgets/home_page.dart';
import 'widgets/Favourite.dart';
import 'widgets/search_page.dart';
import 'widgets/Profile.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "/widgets/welcome.dart";
import "/widgets/sign_in.dart";
import "/widgets/sign_up.dart";
import 'dart:io' show Platform;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDCKu6OFoa2ld7PehNEpxPOY2hjFFqwddA',  // current_key
          appId: '1:503688200210:android:15ca15044adc388e5f18cb',  // mobilesdk_app_id
          messagingSenderId: '503688200210',  // project_number
          projectId: 'food203-476d6'  // project_id
      )
  ) : await Firebase.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Authentication",
      initialRoute: "/",
      routes: {
        "/": (context) => MyLogin(),
        "/welcome": (context) => MyWelcome(),
        "/register": (context) => MyRegister(),
       "/home_page": (context) => HomePage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final List<Widget> screens = [
    HomePage(),
    SearchPage(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
          )
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Color(0xFFf1f5fb),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(milliseconds: 500),
          selectedIndex: index,
          onDestinationSelected: (index) =>
          setState(()=> this.index = index),

          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outlined),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
