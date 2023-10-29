import 'dart:io';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/custom_appbar.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/profile_view_widget.dart';
import 'package:e_commerce_app/widgets/selected_county_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../utils/dimensions.dart';
import '../widgets/custom_app_button.dart';
import '../widgets/language.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppbar(),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _userInfoLayout(
                    context: context,
                    infoBgColor: Theme.of(context).bottomAppBarColor),
                profileSectionLayout(
                    color: Theme.of(context).colorScheme.onPrimary,
                    dividerColor: Theme.of(context).dividerColor,
                    bgColor: Theme.of(context).backgroundColor,
                    context: context)
              ],
            ),
          )
        ],
      ),
    );
  }

  _marginForBody() {
    return const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 14);
  }

  _userInfoLayout({context, infoBgColor}) {
    return profileCardLayOut(
        context: context,
        infoBgColor: infoBgColor,
        userImage: Images.user,
        userName: "Dr.Banner",
        userEmail: "admin@demo.com",
        statusText: "Active");
  }

  profileSectionLayout({color, dividerColor, bgColor, context}) {
    return Expanded(
        flex: 14,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bgColor,
          ),
          margin: _marginForBody(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _themeLayout(color, dividerColor, context),
              dividedSectionLayout(
                  cardIcon: CupertinoIcons.cart,
                  titleText: AppString.text_my_orders.tr,
                  subtext: "Already have 10 orders",
                  titleColor: color,
                  subtextColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                  dividerColor: dividerColor,
                  onAction: () => Get.toNamed(Routes.ORDER)),
              dividedSectionLayout(
                  cardIcon: CupertinoIcons.info,
                  titleText: AppString.text_shipping_address.tr,
                  subtext: "03 Address",
                  subtextColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                  titleColor: color,
                  dividerColor: dividerColor,
                  onAction: () => Get.toNamed(Routes.SHIPPING_ADDRESS)),
              dividedSectionLayout(
                  cardIcon: CupertinoIcons.money_dollar_circle,
                  titleText: AppString.text_payment_method.tr,
                  subtext: "you have 02 cards",
                  titleColor: color,
                  subtextColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                  dividerColor: dividerColor,
                  onAction: () => Get.toNamed(Routes.PAYMENT_METHOD_SCREEN)),
              dividedSectionLayout(
                  cardIcon: CupertinoIcons.star,
                  titleText: AppString.text_my_review.tr,
                  subtext: "Reviews for 5 items",
                  subtextColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                  titleColor: color,
                  dividerColor: dividerColor,
                  onAction: () => Get.toNamed(Routes.MY_REVIEW)),
              infoCardTitleText(text: AppString.text_others.tr),

              dividedSectionLayout(
                cardIcon: Icons.logout_rounded,
                titleText: AppString.text_sign_out.tr,
                subtext: AppString.text_leave_this_app.tr,
                subtextColor:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                titleColor: color,
                dividerColor: dividerColor,
                onAction: () {
                  showLogoutDialog(context);
                },
              ),

              _languageDropDown(),
              // _languageDropDown(),
            ]),
          ),
        ));
  }

  _languageDropDown() {
    return const LanguageDropDown();
  }

  _themeLayout(color, dividerColor, context) {
    return Obx(
      () => dividedSectionLayout(
          cardIcon: Icons.logout_rounded,
          titleText: "",
          subtextColor:
              Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
          titleColor: color,
          dividerColor: dividerColor,
          subtext: AppString.text_click_switch.tr,
          onAction: () {},
          toggleVal: true),
    );
  }
}

Future<void> showLogoutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible:
        false, // Prevents dismissal by tapping outside the dialog
    builder: (BuildContext context) {
      return AlertDialog(
        shape: cardStyle,
        title: SizedBox(
          height: AppLayout.getHeight(70),
          child: Lottie.asset(Images.log_out),
        ),
        content: Text(
          AppString.text_are_you_sure,
          style: AppStyle.normal_text
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: <Widget>[_buttonLayout(context)],
      );
    },
  );
}

_buttonLayout(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(8), right: AppLayout.getWidth(8)),
    child: Row(
      children: [
        Expanded(
            child: SizedBox(
          height: AppLayout.getHeight(56),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Card(
              shape: cardStyle.copyWith(
                  side: BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.onPrimary),
                  borderRadius: BorderRadius.circular(Dimensions.radiusMid)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppString.text_cancel,
                  style: AppStyle.normal_text
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              )),
            ),
          ),
        )),
        customSpacerWidth(width: 12),
        Expanded(
            child: AppButton(
          buttonText: AppString.text_sign_out,
          onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
          buttonColor: AppColor.primaryColor,
          isButtonExpanded: false,
        )),
      ],
    ),
  );
}
