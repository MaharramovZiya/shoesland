import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/presentation/routes/routes.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(SplashScreen(
//     onInitializationComplete: () => runApp(const MyApp()),
//     key: UniqueKey(),
//   ));
// }

void main() {
  runApp(const MyApp());
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
      initialRoute: Routes.bottomNavigationBar,
      getPages: Routes.getPages,
    );
  }
}
