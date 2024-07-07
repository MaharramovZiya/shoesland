import 'package:flutter/material.dart';
import 'package:shoesland/core/widgets/bottom_navigatior_bar_route.dart';
import 'package:shoesland/presentation/screens/cart/cart_screen.dart';
import 'package:shoesland/presentation/screens/details/detail_page.dart';
import 'package:shoesland/presentation/screens/favorites/favorites_screen.dart';
import 'package:shoesland/presentation/screens/home/home_screen.dart';
import 'package:shoesland/presentation/screens/notifications/notification_screen.dart';
import 'package:shoesland/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:shoesland/presentation/screens/profile/profile_screen.dart';

class Routes {
  //onboarding

  static const onboardingScreen = '/';

  //Bottom navigation bar

  static const bottomNavigationBar = '/bottom-nav';

  //App Pages
  static const String home = '/home';
  static const String favourites = '/favourites';
  static const String notifications = '/notifications';
  static const String cartScreen = '/cart';
  static const String profile = '/profile';

  //Other pages

  static const String bestSeller = '/best-seller';
  static const String checkout = '/checkout';
  static const String accountSettings = '/account-setting';

  //detail page

  static const String detail = '/detail';

  //login register recovery page
  static const String login = '/login';
  static const String register = '/register';
  static const String recoveryPassword = '/recovery-password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case bottomNavigationBar:
        return MaterialPageRoute(builder: (_) => BottomNav());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case favourites:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case detail:
        return MaterialPageRoute(builder: (_) => const DetailPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Routes error"),
                  ),
                  body: Center(
                    child: Text('Route not defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
