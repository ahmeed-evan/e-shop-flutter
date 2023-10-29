import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_snakbar.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/gender_controller.dart';
import '../controller/input_controller.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final List<String> _locations = [AppString.text_male, AppString.text_female];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller =Get.find<InputController>();
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar(context: context,text: AppString.text_edit_profile.tr,
          argumentVal: true,
          isNotificationHide: true,
        ),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //user info layout here

                    //user email layout here

                    AppInputField(title: AppString.text_user_name.tr, hint: '',isFieldElevationHide: true,controller: controller.userNameController,),
                    customSpacerHeight(height: 8),

                    AppInputField(title: AppString.text_email.tr, hint: '',isFieldElevationHide: true,controller: controller.emailController,),
                    customSpacerHeight(height: 8),

                    //user contact info layout here
                    AppInputField(title: AppString.text_phone,hint: "",isFieldElevationHide: true,controller: controller.phoneController,),
                    customSpacerHeight(height: 8),
                    //user gender layout here
                    Text(AppString.text_gender.tr,style:_titleStyle(Theme.of(context).colorScheme.onPrimary) ,),
                    customSpacerHeight(height: 12),
                    _userGenderLayout(context),
                    customSpacerHeight(height: 8),
                    //user address layout here
                    AppInputField(
                        title: AppString.text_address.tr,hint: "",isFieldElevationHide: true,controller: controller.addressController),
                    //user about layout here
                    customSpacerHeight(height: 8),

                    AppInputField(
                        title: AppString.text_about_me.tr,hint: "",isFieldElevationHide: true,isButtonExpanded: true,controller: controller.aboutMeController),
                    //_aboutMeLayout()
                  ],
                ),
              ),
              _saveButtonLayout(context),
              customSpacerHeight(height: 30),

            ],
          ),
        ),
      ),
    );
  }
  TextStyle _titleStyle(color) {
    return AppStyle.mid_large_text.copyWith(
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: Dimensions.fontSizeDefault + 2);
  }
  _saveButtonLayout(context) {
    return  Padding(
      padding: marginLayout,
      child: AppButton(
          onPressed: (){
            showToast(text: AppString.text_succesful.tr,context: context,subtext: AppString.text_update_succesful.tr);
            Get.toNamed(Routes.MAIN);
          },
        buttonText: AppString.text_save.tr,
        buttonColor: AppColor.primaryColor,
        isButtonExpanded: false,

      ),
    );
  }
  _userGenderLayout(context) {
    return Obx(() => _genderDropDownField(context: context, locations: _locations));
  }

  _genderDropDownField({required BuildContext context, required locations}) {
    return Container(
      height: AppLayout.getHeight(58),
      decoration: _containerStyle(context),
      child: Center(
        child: Padding(
          padding: marginLayout,
          child: DropdownButton<String>(
            style: const TextStyle(fontWeight: FontWeight.w500),
            isDense: true,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            icon:  Icon(Icons.expand_more,color: Theme.of(context).hintColor,
            ),
            iconEnabledColor: AppColor.normalTextColor,
            hint: _genderText(),
            value: Get.find<GenderController>().dropdownValue.value,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            items: locations.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: AppStyle.mid_large_text
                        .copyWith(color: context.isDarkMode?AppColor.cardColor:AppColor.normalTextColor,fontSize: Dimensions.fontSizeMid-3
                    )),
              );
            }).toList(),
            onChanged: (newValue) {
              Get.find<GenderController>().onValueChanged(newValue??"");
            },
          ),
        ),
      ),
    );

  }

  _containerStyle(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).hintColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(Dimensions.radiusMid-3),
    );
  }

}




_genderText() {
  return Text(
     "Male",
    style: AppStyle.normal_text
        .copyWith(color: AppColor.normalTextColor),
  );
}

