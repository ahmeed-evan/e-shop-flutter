import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_layout.dart';
import '../utils/app_string.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';
import '../widgets/custom_snakbar.dart';
import '../widgets/custom_spacer.dart';

class ChangePassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  ChangePassword({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _changePasswordAppbar(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: AppLayout.getHeight(20), bottom: AppLayout.getHeight(8), left: AppLayout.getWidth(20), right: AppLayout.getWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //old password text field here
                    AppInputField(
                        title: AppString.text_old_password.tr,
                        hint: AppString.text_enter_old_password.tr,
                        isFieldElevationHide: true),
                    customSpacerHeight(height: 8),

                    //new password text field here
                    AppInputField(
                        title: AppString.text_new_password.tr,
                        hint: AppString.text_enter_new_password.tr,
                        isFieldElevationHide: true),
                    customSpacerHeight(height: 8),
                    _alertBoxLayout(context),
                    customSpacerHeight(height: 10),

                    //confirm password text field here
                    AppInputField(
                      title: AppString.text_confim_password.tr,
                      hint: AppString.text_confim_password.tr,
                      isFieldElevationHide: true,
                    )
                  ],
                ),
              ),
              customSpacerHeight(height: 30),
              _saveButtonLayout(context),
              customSpacerHeight(height: 14),
            ],
          ),
        ),
      ),
    );
  }

  _saveButtonLayout(BuildContext context) {
    return Padding(
      padding: marginLayout,
      child: AppButton(
        buttonText: AppString.text_save.tr,
        onPressed: () {
          showToast(
              text: AppString.text_succesful.tr,
              context: context,
              subtext: AppString.text_update_succesful.tr);

          Get.toNamed(Routes.MAIN);
        },
        buttonColor: AppColor.primaryColor,
        isButtonExpanded: false,
      ),
    );
  }

  _changePasswordAppbar(BuildContext context) {
    return appBar(context: context,text: AppString.text_change_password.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }
}

_alertBoxLayout(context) {
  return alertBox(
      context: context, alertText: AppString.text_password_alert_text.tr);
}

Widget alertBox({required context, required alertText}) {
  return Container(
    margin:
        EdgeInsets.only(top: AppLayout.getHeight(Dimensions.fontSizeDefault)),
    width: MediaQuery.of(context).size.width,
    decoration: _boxDecoration(context),
    child: Column(
      children: [
        alertBoxBodyText(alertText,context),
      ],
    ),
  );
}

Decoration  _boxDecoration(BuildContext context) {
  return AppStyle.ContainerStyle.copyWith(
      color: context.isDarkMode?AppColor.normalTextColor:AppColor.alertBgColor, borderRadius: borderRadius);
}

BorderRadius get borderRadius {
  return BorderRadius.circular(Dimensions.radiusDefault);
}

Container alertBoxBodyText(alertText,context) {
  return Container(
      margin: EdgeInsets.only(
          top: AppLayout.getHeight(Dimensions.fontSizeDefault),
          left: AppLayout.getWidth(Dimensions.fontSizeDefault),
          right: AppLayout.getWidth(Dimensions.fontSizeDefault - 6),
          bottom: AppLayout.getHeight(Dimensions.fontSizeDefault)),
      child: Text(
        alertText,
        style: alertTextStyle(context),
      ));
}

TextStyle  alertTextStyle(context) {
  return AppStyle.mid_large_text.copyWith(
      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
      fontWeight: FontWeight.w300,
      fontSize: Dimensions.fontSizeDefault,
      fontStyle: FontStyle.italic);
}
