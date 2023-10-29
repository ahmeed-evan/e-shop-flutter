import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/screens/edit_profile.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/profile_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/input_controller.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_spacer.dart';


class ViewProfile extends StatelessWidget{
  const ViewProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // user default appbar here
            _userProfileAppbar(context),
            customSpacerHeight(height: 10),
            // profile view image here
             Obx(() => _profileImageLayout(),),
            customSpacerHeight(height: 10),
            // user others information layout here
            _userInfoLayout(context),
          ],
        ),
      ),
    );
  }

  _profileImageLayout() {
    return circleAvatarStyle(
      userImage: Images.user,
    );
  }


  _changePasswordLayout(context) {
    return changePassword(
      context: context,
      onAction: ()=>Get.toNamed(Routes.CAHANGE_PASSWORD),
    );
  }

  _userInfoLayout(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _userNameText(context),
        customSpacerHeight(height: 12),
        _changePasswordLayout(context),
        _userInformationView(context),
      ],
    );
  }

  _userInformationView(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSpacerHeight(height: 8),
          _userAboutText(context),
          customSpacerHeight(height: 14),
          infoCardTitleText(text: AppString.text_general.tr,color: Theme.of(context).colorScheme.onPrimary),
           _userEmailText(context),
          _userContactText(context),
         _userIdText(context),
          customSpacerHeight(height: 14),
          _userAddressText(context),
           _userGenderText(context),
        ],
      ),
    );
  }

  _userNameText(context) {
    return userName(
        text: "Dr.Banner",context: context);
  }


  _userAboutText(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoCardTitleText(text: AppString.text_about_me.tr,color: Theme.of(context).colorScheme.onPrimary),
        aboutText(text:"Hello. I am an Apps Developer.I am in love with coding.It gives me the freedom of my mind and helps me to express myself and my personality",context: context),
      ],
    );
  }
  }

  _userEmailText(context) {
    return cardView(
        dynamicText:  "admin@demo.com",
        titleText: AppString.text_email.tr,
        icon: CupertinoIcons.mail,
    context: context
    );
  }

  _userContactText(context) {
    return cardView(
        dynamicText: "+574 824 824",
        context: context,

        titleText: AppString.text_phone.tr,
        icon: CupertinoIcons.phone);
  }

  _userIdText(context) {
    return cardView(
        dynamicText:"PSDDKAFNEI",
        context: context,

        titleText: AppString.text_user_id.tr,
        icon: CupertinoIcons.person);
  }

  _userAddressText(context) {
    return cardView(
        dynamicText: "USA,434,SY4",
        context: context,

        titleText: AppString.text_address,
        icon: CupertinoIcons.home);
  }

  _userGenderText(context) {
    return cardView(
        dynamicText: "Male",
        context: context,

        titleText: AppString.text_gender.tr,
        icon: Icons.male);
  }

  _userProfileAppbar(context) {
    return profileViewAppbar(
      context: context,
        titleText: AppString.text_my_profile.tr,
        bgColor: Theme.of(context).backgroundColor,
        rightBtnAction: () {
          Get.find<InputController>().userNameController.text = "Dr.Banner".toString();
          Get.find<InputController>().emailController.text = "addmin@demo.com".toString();
          Get.find<InputController>().phoneController.text = "+574 824 824".toString();
          Get.find<InputController>().addressController.text = "USA,434,SY4".toString();
          Get.find<InputController>().aboutMeController.text = "Hello. I am an Apps Developer.I am in love with coding.It gives me the freedom of my mind and helps me to express myself and my personality".toString();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const EditProfile(),));
        }
    );
  }




Widget profileViewAppbar({titleText, bgColor = AppColor.backgroundColor, rightBtnAction, context}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon:  Icon(
        CupertinoIcons.arrow_left,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
    centerTitle: true,
    actions: [

      Container(
        height: AppLayout.getHeight(38),width: AppLayout.getWidth(38),
        child: GestureDetector(
            onTap: rightBtnAction,
            child:Icon(Icons.edit_document,color: Theme.of(context).colorScheme.onPrimary,)),
      ),
      customSpacerWidth(width: 8),
    ],
    title: Text(
      titleText,
      style: AppStyle.title_text.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: Dimensions.fontSizeDefault + 1),
    ),
    backgroundColor: bgColor,
  );
}
