import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_string.dart';
import '../widgets/custom_snakbar.dart';

class AddPaymentMethod extends StatelessWidget {
  const AddPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _addPaymentMethodAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Images.paymet_cart_1),
            _inputFieldLayout(context),
          ],
        ),
      ),
    );
  }

  _addPaymentMethodAppbar(context) {
    return appBar(
      context: context,
      text: AppString.text_add_payment_method.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }

  _inputFieldLayout(BuildContext context) {
    return Padding(
      padding: marginLayout,
      child: Column(
        children: [
          AppInputField(title: AppString.text_card_holder_name.tr, hint: AppString.text_ex.tr,isFieldElevationHide: true,),
          AppInputField(title: AppString.text_card_number.tr, hint: "**** **** **** 156451",isFieldElevationHide: true),
          customSpacerHeight(height: 14),

          Row(
            children: [
              Expanded(child: AppInputField(title: AppString.text_CVV.tr, hint: "Ex:423",isFieldElevationHide: true),
              ),
              Expanded(child:AppInputField(title: AppString.text_expiraement_date.tr, hint: "03/21",isFieldElevationHide: true),
              ),
            ],
          ),

          customSpacerHeight(height: 60),
          AppButton(buttonText: AppString.text_add_new_card.tr, onPressed: (){
            
            showToast(context: context,text:AppString.text_succesful.tr,subtext: AppString.text_your_payment_add_succesful.tr);
            Get.toNamed(Routes.MAIN);

          }, buttonColor: AppColor.primaryColor,isButtonExpanded: false,)


        ],
      ),
    );
  }

}
