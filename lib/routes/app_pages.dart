import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/favorite.dart';
import 'package:e_commerce_app/screens/forget_password.dart';
import 'package:e_commerce_app/screens/my%20reviews.dart';
import 'package:e_commerce_app/screens/my_order.dart';
import 'package:e_commerce_app/screens/notification.dart';
import 'package:e_commerce_app/screens/otp_verification.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:e_commerce_app/screens/profile.dart';
import 'package:e_commerce_app/screens/setting.dart';
import 'package:e_commerce_app/screens/sign_in.dart';
import 'package:e_commerce_app/screens/sing_up.dart';
import 'package:e_commerce_app/screens/view_all.dart';
import 'package:get/get.dart';
import '../screens/add_payment_method.dart';
import '../screens/add_shipping_address.dart';
import '../screens/change_password.dart';
import '../screens/edit_shipping_address.dart';
import '../screens/filter_screen.dart';
import '../screens/home.dart';
import '../screens/main.dart';
import '../screens/my_cart.dart';
import '../screens/onboarding.dart';
import '../screens/payment_method.dart';
import '../screens/product_review.dart';
import '../screens/search_screen.dart';
import '../screens/shipping_address.dart';
import '../screens/splash.dart';
import '../screens/view_profile.dart';
import '../screens/write_a_review.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH_SCREEN;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  const HomeScreen(),
    ),
    GetPage(
      name: _Paths.ONBOARD_SCREEN,
      page: () => OnboardScreen(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () =>  FavoriteScreen(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  const ProfileScreen(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const MyOrderScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () =>  const SignInScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () =>  const SignUpScreen(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () =>  const ForgetPassword(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () =>  const OTPScreen(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DEATAILS,
      page: () =>   const ProductDetails(),
    ),

    GetPage(
      name: _Paths.FAVORITE,
      page: () =>    const FavoriteScreen(),
    ),
    GetPage(
      name: _Paths.VIEW_ALL,
      page: () =>   const ViewAllScreen(),
    ),

    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () =>    const SearchScreen(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      page: () =>    const NotificationScreen(),
    ),

    GetPage(
      name: _Paths.MY_CART_SCREEN,
      page: () =>  const MyCart(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHOD_SCREEN,
      page: () =>  const PaymentMethodScreen(),
    ),

    GetPage(
      name: _Paths.ADD_PAYMENT_METHOD,
      page: () =>  const AddPaymentMethod(),
    ),

    GetPage(
      name: _Paths.ADD_SHPPING_ADDRESS,
      page: () =>   AddShippingAddress(),
    ),
    GetPage(
      name: _Paths.MY_REVIEW,
      page: () =>   const MyReviewScreen(),
    ),

    GetPage(
      name: _Paths.SETTING_SCREEN,
      page: () =>   const SettingScreen(),
    ),

   GetPage(
      name: _Paths.FILTER_SCREEN,
      page: () =>   const FilterScreen(),
    ),

    GetPage(
      name: _Paths.PRODUCT_REVIEW_SCREEN,
      page: () =>   const ProductReview(),
    ),

    GetPage(
      name: _Paths.WRITE_REVIEW_SCREEN,
      page: () =>   const WriteAReview(),
    ),

    GetPage(
      name: _Paths.SHIPPING_ADDRESS,
      page: () =>    const ShippingAddress(),
    ),
    GetPage(
      name: _Paths.EDIT_SHIPPING_ADDRESS,
      page: () =>    EditShippingAddress(),
    ),
    GetPage(
      name: _Paths.MY_PRIFILE,
      page: () =>    const ViewProfile(),
    ),    GetPage(
      name: _Paths.CAHANGE_PASSWORD,
      page: () =>     ChangePassword(),
    ),

  ];
}
