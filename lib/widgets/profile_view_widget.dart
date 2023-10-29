import 'dart:io';

import 'package:e_commerce_app/controller/theme_controller.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/pick_image_controller.dart';

Widget profileCardLayOut(
    {required context,
    required String userImage,
    required userName,
    required userEmail,
    required infoBgColor,
    required String statusText}) {
  return Expanded(
      flex: 3,
      child: Container(
        decoration: _infoLayoutStyle(infoBgColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => _userImageLayout(userImage),
                  ),
                  customSpacerWidth(width: 14),
                  _userInfo(userEmail, userName),
                  _userStatusView(statusText: statusText, context: context)
                ],
              ),
              const Spacer(),
              _moveProfileView(onAction: () => Get.toNamed(Routes.MY_PRIFILE)),
            ],
          ),
        ),
      ));
}

Widget cardView({icon, dynamicText, titleText, context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      children: [
        cardIconView(cardIcon: icon),
        customSpacerWidth(width: 8),
        _boxLayout(dynamicText, titleText, context),
      ],
    ),
  );
}

_boxLayout(dynamicText, titleText, context) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dynamicText,
          style: AppStyle.small_text_black.copyWith(
            fontSize: Dimensions.fontSizeSmall + 3,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Text(
          titleText,
          style: AppStyle.small_text.copyWith(
            color: Theme.of(context).hintColor,
            fontSize: Dimensions.fontSizeDefault - 1,
          ),
        ),
      ],
    ),
  );
}

Widget circleAvatarStyle({final userImage}) {
  return Stack(
    children: [
      Container(
        height: AppLayout.getHeight(74),
        width: AppLayout.getWidth(74),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: ClipOval(
          child: FadeInImage(
            image: Get.find<PickImageController>().pickedImage.value == null
                ? placeholderImages
                : Image.file(File(Get.find<PickImageController>()
                        .pickedImage
                        .value!
                        .path))
                    .image,
            placeholder:
                Get.find<PickImageController>().pickedImage.value == null
                    ? placeholderImages
                    : Image.file(File(Get.find<PickImageController>()
                            .pickedImage
                            .value!
                            .path))
                        .image,
            imageErrorBuilder: (context, error, stackTrace) {
              return CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    Get.find<PickImageController>().pickedImage.value == null
                        ? placeholderImages
                        : Image.file(File(Get.find<PickImageController>()
                                .pickedImage
                                .value!
                                .path))
                            .image,
              );
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
      _pickImageFormStorage()
    ],
  );
}

_pickImageFormStorage() {
  return Positioned(
      right: 0,
      bottom: 0,
      child: CircleAvatar(
          radius: 12,
          backgroundColor: AppColor.primaryColor,
          child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => Get.find<PickImageController>()
                  .pickImage(ImageSource.gallery),
              icon: const Icon(
                Icons.add_a_photo_outlined,
                size: 14,
                color: AppColor.cardColor,
              ))));
}

AssetImage get placeholderImages {
  return AssetImage(Images.user);
}

Widget cardIconView({cardIcon}) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Icon(
            cardIcon,
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        ),
      ));
}

Widget changePassword({context, onAction}) {
  return InkWell(
    onTap: () => onAction(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            AppString.text_change_password.tr,
            style: AppStyle.small_text.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeDefault + 1),
          ),
        ),
        customSpacerWidth(width: 4),
        Icon(
          Icons.arrow_forward,
          color: AppColor.primaryColor,
          size: 16,
        )
      ],
    ),
  );
}

Widget userName({required text, context}) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(left: AppLayout.getWidth(12)),
      child: Text(
        text,
        style: AppStyle.mid_large_text.copyWith(
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: Dimensions.fontSizeMid + 1),
      ),
    ),
  );
}

Widget designationText({required desText, required status}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Text(
            desText,
            style: AppStyle.small_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeSmall + 1),
          ),
          customSpacerWidth(width: 8),
          const Icon(
            Icons.circle,
            size: 8,
            color: AppColor.hintColor,
          ),
        ],
      ),
      customSpacerWidth(width: 8),
      Text(
        status,
        style: AppStyle.small_text.copyWith(
            color: AppColor.hintColor, fontSize: Dimensions.fontSizeSmall + 1),
      ),
    ],
  );
}

Widget aboutText({required text, context}) {
  return Text(
    text,
    style: AppStyle.small_text.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: Dimensions.fontSizeDefault),
  );
}

Widget _moveProfileView({onAction}) {
  return Center(
    child: InkWell(
      onTap: () => onAction(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _viewProfileText(),
          customSpacerWidth(width: 8),
          Icon(
            Icons.arrow_forward,
            color: AppColor.cardColor,
            size: Dimensions.fontSizeDefault + 3,
          )
        ],
      ),
    ),
  );
}

Widget _viewProfileText() {
  return Text(
    AppString.text_view_profile.tr,
    style: AppStyle.small_text.copyWith(fontSize: Dimensions.fontSizeDefault),
  );
}

Decoration _infoLayoutStyle(infoBgColor) {
  return AppStyle.ContainerStyle.copyWith(
      color: infoBgColor,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.radiusMid + 4),
          bottomRight: Radius.circular(Dimensions.radiusMid + 4)));
}

_userImageLayout(userImage) {
  return Container(
    height: AppLayout.getHeight(62),
    width: AppLayout.getWidth(62),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.transparent,
    ),
    child: ClipOval(
      child: FadeInImage(
        image: Get.find<PickImageController>().pickedImage.value == null
            ? placeholderImages
            : Image.file(File(
                    Get.find<PickImageController>().pickedImage.value!.path))
                .image,
        placeholder: Get.find<PickImageController>().pickedImage.value == null
            ? placeholderImages
            : Image.file(File(
                    Get.find<PickImageController>().pickedImage.value!.path))
                .image,
        imageErrorBuilder: (context, error, stackTrace) {
          return CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage:
                Get.find<PickImageController>().pickedImage.value == null
                    ? placeholderImages
                    : Image.file(File(Get.find<PickImageController>()
                            .pickedImage
                            .value!
                            .path))
                        .image,
          );
        },
        fit: BoxFit.cover,
      ),
    ),
  );
}

_userInfo(userEmail, userName) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _userNameText(userName: userName),
        customSpacerHeight(height: 2),
        _userEmail(userEmail: userEmail)
      ],
    ),
  );
}

_userStatusView({required String statusText, context}) {
  return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMid)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 3, bottom: 3),
        child: Text(
          statusText,
          style: AppStyle.normal_text_black.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 12,
          ),
        ),
      ));
}

_userNameText({required userName}) {
  return Text(
    userName,
    style: AppStyle.mid_large_text
        .copyWith(fontWeight: FontWeight.w800, letterSpacing: 0.2),
  );
}

_userEmail({required userEmail}) {
  return Text(
    userEmail,
    style: AppStyle.normal_text.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: Dimensions.fontSizeDefault - 1,
        letterSpacing: 0.2),
  );
}

Widget dividedSectionLayout(
    {cardIcon,
    titleText,
    subtext,
    subtextColor,
    onAction,
    bool toggleVal = false,
    required titleColor,
    required dividerColor}) {
  var controller = Get.find<ToggleSwitchController>();
  return InkWell(
    onTap: () => onAction(),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _iconShapeLayout(
                  icon: toggleVal == true
                      ? controller.switchValue.isTrue
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode
                      : cardIcon,
                ),
                customSpacerWidth(width: 12),
                _layoutInfo(
                    toggleVal == true
                        ? controller.switchValue.isTrue
                            ? AppString.text_dark_mode.tr
                            : AppString.text_light_mode.tr
                        : titleText,
                    subtext,
                    titleColor,
                    subtextColor
                )
              ],
            ),
            const Spacer(),
            toggleVal == true
                ? Expanded(
                  child: Switch(
                      value: controller.switchValue.value,
                      activeColor: AppColor.primaryColor,
                      onChanged: (value) => controller.toggleSwitch(),
                    ),
                )
                : _avatarArrowIcon()
          ],
        ),
        customSpacerHeight(height: 4),
        Divider(
          thickness: 0.5,
          color: dividerColor,
        ),
        customSpacerHeight(height: 4),
      ],
    ),
  );
}

Widget infoCardTitleText({required text, Color color = AppColor.hintColor}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(20)),
    child: Text(
      text,
      style: AppStyle.mid_large_text.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSizeDefault + 2),
    ),
  );
}

_layoutInfo(titleText, subtext, color, subTexColor) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titleText,
        style: AppStyle.small_text_black.copyWith(
            fontSize: Dimensions.fontSizeDefault + 2,
            color: color,
            fontWeight: FontWeight.w400),
      ),
      Text(
        subtext,
        style: AppStyle.normal_text.copyWith(
            fontSize: Dimensions.fontSizeDefault - 3,
            color: subTexColor,
            fontWeight: FontWeight.w300,overflow: TextOverflow.fade,),
      ),
    ],
  );
}

_iconShapeLayout({icon}) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Icon(
            icon,
            color: AppColor.primaryColor,
          ),
        ),
      ));
}

_avatarArrowIcon() {
  return CircleAvatar(
    radius: 15,
    backgroundColor: AppColor.hintColor.withOpacity(0.1),
    child: SvgPicture.asset(
      Images.right_arrow,
      width: AppLayout.getWidth(22),
      height: AppLayout.getWidth(22),
      // ignore: deprecated_member_use
      color: AppColor.primaryColor.withOpacity(0.8),
    ),
  );
}
