import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/selected_county_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_string.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/language.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar:_settingAppbar(context) ,
      body: Padding(
        padding: marginLayout,
        child: Column(
          children: [
            _languageDropDown(),

            _layout(context: context,leftText: AppString.text_theme.tr,widget:  Icon(Icons.arrow_forward_ios_rounded,color: AppColor.primaryColor,size: Dimensions.fontSizeMid,)),

            _layout(context: context,leftText: AppString.text_notification.tr,
                
                onAction: ()=>Get.toNamed(Routes.NOTIFICATION_SCREEN),
                widget:  Icon(Icons.arrow_forward_ios_rounded,color: AppColor.primaryColor,size: Dimensions.fontSizeMid,)
            ),

            _layout(context: context,leftText: AppString.text_app_version.tr,


                onAction: ()=>Get.toNamed(Routes.NOTIFICATION_SCREEN),
                widget:  Text("1 . 10",style: AppStyle.mid_large_text.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeMid-2),)
            ),


          ],
        ),
      ),
    );
  }
  _settingAppbar(context) {
    return appBar(
      context: context,
      text: AppString.text_setting.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }
  _languageDropDown() {
    return const LanguageDropDown();
  }

  _layout({context,leftText,Widget ?widget,onAction}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: onAction,
        child: Card(
          shape: cardStyle.copyWith(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault+2)),

          elevation: 0,
          shadowColor: Colors.grey.withOpacity(0.2),

          child: SizedBox(
            height: AppLayout.getHeight(50),
            child: Padding(
              padding: marginLayout,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(leftText,style: AppStyle.mid_large_text.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeDefault+1),),
                  Container(child: widget,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
