import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:nomadic_florist/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_controller.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPref));
}

class MyApp extends StatelessWidget {
  const MyApp(this.sharedPreferences, {Key? key}) : super(key: key);
  final SharedPreferences sharedPreferences;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_4db0b9479efc444585cab9babed270eb',
        builder: (context, navigatorKey) {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Nomadic Florist',
            theme: ThemeData(
              textTheme:
                  GoogleFonts.workSansTextTheme(Theme.of(context).textTheme),
              primaryColor: firstColor,

              // setting the appbar theme of the whole app
              appBarTheme: const AppBarTheme(
                color: firstColor,
                elevation: 1,
                centerTitle: true,

                //for the status bar of our phone
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: firstColor,
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light),
              ),
            ),
            initialBinding: BindingsBuilder(() {
              Get.put(AppController(sharedPreferences), permanent: true);
            }),
            home: const SplashScreen(),
          );
        });
  }
}
