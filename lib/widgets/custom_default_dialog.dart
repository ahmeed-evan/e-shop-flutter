import 'package:e_commerce_app/controller/add_to_cart_controller.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future defaultDialog(
    {context,
    text,
    subText,
    Widget? widget,
    fontSize,
    isHideButton = false,
    btnWidget}) {
  return Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.radiusMid),
              ),
            ),
            child: _dialogContent(context, text, subText, widget, fontSize,
                isHideButton, btnWidget),
          ),
        ),
      ],
    ),
  );
}

_dialogContent(
    context, text, subtext, widget, fontSize, isHideButton, btnWidget) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
    child: Material(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          widget != null
              ? const SizedBox(height: 0)
              : const SizedBox(height: 10),
          widget ??
              CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                child: const Icon(
                  CupertinoIcons.mail,
                  color: AppColor.cardColor,
                ),
              ),
          customSpacerHeight(height: 20),
          Text(
            text,
            style: AppStyle.title_text.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: fontSize ?? Dimensions.fontSizeMid - 3),
          ),
          // fontSize ??
          customSpacerHeight(height: 12),
          Center(
              child: Text(subtext,
                  textAlign: TextAlign.center,
                  style: AppStyle.normal_text.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.6)))),

          isHideButton != true
              ? fontSize != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: AppButton(
                        buttonText: AppString.text_back_to_shopping,
                        onPressed: () {
                          Get.find<AddToCartController>().clearAddToCart();
                          Get.toNamed(Routes.MAIN);
                        },
                        buttonColor: AppColor.primaryColor,
                        isButtonExpanded: false,
                      ),
                    )
                  : Container()
              : Container(
                  child: btnWidget,
                ),

          const SizedBox(height: 20),
          //Buttons
        ],
      ),
    ),
  );
}
