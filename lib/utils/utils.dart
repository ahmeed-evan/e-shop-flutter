import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../screens/cart_screen.dart';
import '../screens/favorite.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import 'app_string.dart';
import 'images.dart';


List  get list=>_items;

List  get categoryIndex=>_categoryList;

List  get bannerIndex=>_banners;
List  get onboardImageIndex=>_onboardImage;
List  get onboardTitleIndex=>_onboardTitle;
List  get onboardDescriptionIndex=>_onboardDescription;

List<String>  get countyList=>_county;
List<String>  get username=>_reviewerName;



List _categoryList = [
  "All Category",
  "Outdoor",
  "Tennis",
  "Outdoor",
  "Tennis",
];



List<String> _reviewerName = [
  "Tracy Mosby",
  "Cherub",
  "Angelic",
  "Rifat",
  "TurboSlayer",
];


final List _banners = [
  Images.banner_1,
  Images.banner_2,
  Images.banner_3,
];

List<String> _items=[
  Images.paymet_cart_1,
  Images.paymet_cart_1,

];



final List _onboardImage = [
  Images.getOder,
  Images.confirm_oder,
  Images.payment,
];

final List _onboardTitle = [
  AppString.text_add_to_cart.tr,
  AppString.text_confirm_oder.tr,
  AppString.text_easy_safe_payment.tr,
];

final List _onboardDescription = [
  AppString.text_find_your.tr,
  AppString.text_find_your.tr,
  AppString.text_find_your.tr,
];

final screensLayoutForBtnNav = <Widget>[
  const HomeScreen(),
  const CartScreen(),
  const FavoriteScreen(),
  const ProfileScreen(),
];

 List<String> _county = ['New York', 'Aurora County', 'Jones County', 'Austin County'];
