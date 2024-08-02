//Routes with get x
import 'package:get/get.dart';
import 'package:shoesland/presentation/screens/account_settings/account_screen.dart';
import 'package:shoesland/presentation/screens/auth/login/login_screen.dart';
import 'package:shoesland/presentation/screens/auth/recovery_password/recovery_screen.dart';
import 'package:shoesland/presentation/screens/auth/register/register_screen.dart';
import 'package:shoesland/presentation/screens/best_seller/best_seller_screen.dart';
import 'package:shoesland/presentation/screens/checkout/checkout_screen.dart';
import 'package:shoesland/presentation/screens/cart/cart_screen.dart';
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
  static const String cart = '/cart';

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
        page: () => const BottomNav(),
        transition: Transition.fade),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: favourites, page: () => const FavoritesScreen()),
    GetPage(name: bestSeller, page: () => const BestSellerScreen()),
    GetPage(name: notifications, page: () => const NotificationScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),

    //Account settings
    GetPage(name: accountSettings, page: () => const AccountScreen()),

    //checkout

    GetPage(name: checkout, page: () => const CheckoutScreen()),

    //cart
    GetPage(name: cart, page: () => const CartScreen()),

    // ignore: prefer_const_constructors
    // GetPage(name: detail, page: () =>  DetailPage(product: productList.first,)),

    //Detail page with getx

    //auth Login register recovery password screen to UI

    GetPage(
        name: login,
        page: () => const LoginScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: register,
        page: () => const RegisterScreen(),
        transition: Transition.fade),
    GetPage(
        name: recoveryPassword,
        page: () => const RecoveryScreen(),
        transition: Transition.fade),
  ];
}
