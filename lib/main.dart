import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesland/config/routes.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SplashScreen(
    onInitializationComplete: () => runApp(const MyApp()),
    key: UniqueKey(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main',
      theme: ThemeData(
        scaffoldBackgroundColor: Colours.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colours.backgroundColor,
        ),
      ),
      initialRoute: Routes.onboardingScreen,
      getPages: Routes.getPages,
    );
  }
}
