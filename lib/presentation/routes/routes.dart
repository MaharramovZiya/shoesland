// Presentation/routes/routes.dart

import 'package:get/get.dart';
import 'package:shoesland/presentation/screens/cart/cart_screen.dart';
import 'package:shoesland/presentation/screens/details/detail_page.dart';
import 'package:shoesland/presentation/screens/favorites/favorites_screen.dart';
import 'package:shoesland/presentation/screens/home/home_screen.dart';
import 'package:shoesland/presentation/screens/notifications/notification_screen.dart';
import 'package:shoesland/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:shoesland/presentation/screens/profile/profile_screen.dart';
import 'package:shoesland/core/widgets/bottom_navigatior_bar_route.dart';

class Routes {
  // Onboarding
  static const String onboardingScreen = '/';

  // Bottom navigation bar
  static const String bottomNavigationBar = '/bottom-nav';

  // App Pages
  static const String home = '/home';
  static const String favourites = '/favourites';
  static const String notifications = '/notifications';
  static const String cartScreen = '/cart';
  static const String profile = '/profile';

  // Other pages
  static const String bestSeller = '/best-seller';
  static const String checkout = '/checkout';
  static const String accountSettings = '/account-setting';

  // Detail page
  static const String detail = '/detail';

  // Login register recovery page
  static const String login = '/login';
  static const String register = '/register';
  static const String recoveryPassword = '/recovery-password';

  static List<GetPage> getPages = [
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(
        name: bottomNavigationBar,
        page: () => BottomNav(),
        transition: Transition.fade),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: favourites, page: () => const FavoritesScreen()),
    GetPage(name: cartScreen, page: () => const CartScreen()),
    GetPage(name: notifications, page: () => const NotificationScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: detail, page: () => const DetailPage()),
  ];
}
