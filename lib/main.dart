import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:shoesland/logic/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:shoesland/logic/cubits/filter_cubit.dart';
import 'package:shoesland/logic/cubits/notification_cubit.dart';
import 'package:shoesland/logic/cubits/shoe_counter.dart';
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
          BlocProvider<ShoeCounterCubit>(
            create: (context) => ShoeCounterCubit(),
          ),
          BlocProvider<NotificationProductCubit>(
            create: (context) => NotificationProductCubit(),
          ),
          BlocProvider<FilterCubit>(
            create: (context) => FilterCubit(),
          ),
          BlocProvider<FavoriteBloc>(
            create: (context) => FavoriteBloc(),
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
          initialRoute: Routes.favourites,
          getPages: Routes.getPages,
        ));
  }
}
