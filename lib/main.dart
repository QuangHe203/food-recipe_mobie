import "dart:io";
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "/widgets/welcome.dart";
import "/widgets/sign_in.dart";
import "/widgets/sign_up.dart";
import "/widgets/home_page.dart";
import "/widgets/search_page.dart";
import "/widgets/favourite.dart";
import "/widgets/setting.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyCJCJyEkO1DbDjdcNwryf_NE9ljhO3soVE',  // current_key
          appId: '1:808962038223:android:aead1f39436af5a8871aba',  // mobilesdk_app_id
          messagingSenderId: '808962038223',  // project_number
          projectId: 'food-recipe-5ebe6'  // project_id
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
        "/home": (context) => HomePage(),
        "/search": (context) => SearchPage(),
        "/favourite": (context) => FavouritePage(),
        "/setting": (context) => MySetting(),
      },
    );
  }
}
