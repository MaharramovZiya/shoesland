import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/logic/blocs/bloc/cart_bloc.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Main',
          theme: ThemeData(
            scaffoldBackgroundColor: Colours.backgroundColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colours.backgroundColor,
            ),
          ),
          initialRoute: Routes.checkout,
          getPages: Routes.getPages,
        ));
  }
}
