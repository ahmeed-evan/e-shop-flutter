import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/home_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_color.dart';
import '../widgets/custom_app_button.dart';
import '../widgets/custom_default_dialog.dart';
import '../widgets/dotted_view.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _myCartAppbar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSpacerHeight(height: 12),
              _userInfoLayout(context),
              const Spacer(),
              _checkoutLayout(context),
              customSpacerHeight(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  _myCartAppbar(context) {
    return appBar(
      context: context,
      text: AppString.text_my_cart.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }

  _userInfoLayout(BuildContext context) {
    return Padding(
      padding: marginLayout,
      child: Card(
        elevation: 0,
        shape: roundedRectangleBorder,
        shadowColor: Colors.grey.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.text_contact_info.tr,
                style: AppStyle.normal_text_black.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.8),
                    fontWeight: FontWeight.w200),
              ),
              customSpacerHeight(height: 12),
              _userInfoStyle(
                  context: context,
                  text: AppString.text_email.tr,
                  responseText: "admin@demo.com",
                  icon: Icons.email_outlined,
                  editIcon: Icons.edit),
              _userInfoStyle(
                  context: context,
                  text: AppString.text_phone.tr,
                  responseText: "+234-434-4343",
                  icon: Icons.call,
                  editIcon: Icons.edit),
              _addressLayout(context),
            ],
          ),
        ),
      ),
    );
  }

  _userInfoStyle(
      {required context,
      required text,
      required responseText,
      required IconData? icon,
      required IconData? editIcon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Card(
            elevation: 0,
            shape: roundedRectangleBorder,
            color: Theme.of(context).hintColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          customSpacerWidth(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                responseText,
                style: AppStyle.normal_text_black.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                text,
                style: AppStyle.normal_text_black.copyWith(
                    color: Theme.of(context).hintColor,
                    overflow: TextOverflow.ellipsis),
              )
            ],
          ),
          customSpacerWidth(width: MediaQuery.of(context).size.width / 6),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                editIcon,
                color: Theme.of(context).hintColor,
              ))
        ],
      ),
    );
  }

  _addressLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customSpacerHeight(height: 12),
        Text(
          AppString.text_address.tr,
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
              fontWeight: FontWeight.w200),
        ),
        customSpacerHeight(height: 8),
        Text(
          "1802 Airport Road,USA",
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).hintColor, fontWeight: FontWeight.w400),
        ),
        customSpacerHeight(height: 12),
        Image.asset(Images.google_map),
        Text(
          AppString.text_payment_method.tr,
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
              fontWeight: FontWeight.w200),
        ),
        _paymentMethod(context)
      ],
    );
  }

  _checkoutLayout(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: marginLayout.copyWith(bottom: 8, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.text_sub_total.tr,
                  style: AppStyle.normal_text_black.copyWith(
                      color: Theme.of(context).hintColor,
                      fontSize: Dimensions.fontSizeMid - 3,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  "\$753.00",
                  style: AppStyle.normal_text_black.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Dimensions.fontSizeMid - 3),
                ),
              ],
            ),
            customSpacerHeight(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.text_delivery.tr,
                  style: AppStyle.normal_text_black.copyWith(
                      color: Theme.of(context).hintColor,
                      fontSize: Dimensions.fontSizeMid - 3),
                ),
                Text(
                  "\$60.00",
                  style: AppStyle.normal_text_black.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Dimensions.fontSizeMid - 3),
                ),
              ],
            ),
            customSpacerHeight(height: 14),
            dottedSalaryView(height: 342),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.text_total_cost.tr,
                  style: AppStyle.normal_text_black
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  "\$753.00",
                  style: AppStyle.normal_text_black
                      .copyWith(color: AppColor.primaryColor),
                ),
              ],
            ),
            customSpacerHeight(height: 22),
            AppButton(
              buttonText: AppString.text_checkout.tr,
              onPressed: () {
                defaultDialog(
                    text: AppString.text_your_order_succesful.tr,
                    context: context,
                    widget: SizedBox(
                      height: AppLayout.getHeight(120),
                      child: Lottie.asset(Images.success),
                    ),
                    subText: "",
                    fontSize: Dimensions.fontSizeMid,
                );
              },
              buttonColor: AppColor.primaryColor,
              isButtonExpanded: false,
            ),
            customSpacerHeight(height: 12)
          ],
        ),
      ),
    );
  }

  _paymentMethod(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      color: Theme.of(context).hintColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: AppLayout.getHeight(20),
              child: Image.asset(Images.master_card),
            ),
            Text("Master Card ***8756",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary,overflow: TextOverflow.ellipsis),),
            IconButton(onPressed: ()=>Get.toNamed(Routes.PAYMENT_METHOD_SCREEN), icon: Icon(Icons.edit,color: Theme.of(context).hintColor.withOpacity(0.9),))
          ],
        ),
      ),
    );
  }
}
