import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/selected_county_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/language_controller.dart';
import '../localization/enum/language.dart';
import '../utils/app_color.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  final items = [
    'English',
    'Bangla',
    'Spanish',
  ];
  String? initValue;

  @override
  void initState() {
    _getLanguageName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      shape: cardStyle.copyWith(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2)),
      elevation: 0,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: SizedBox(
        height: AppLayout.getHeight(50),
        child: Row(children: [
          _iconShapeLayout(icon: Icons.language),
          customSpacerWidth(width: 12),
          // here is the language default text
          _languageDefaultText(),
          // selected language here
          DropdownButton(
            underline: Container(),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColor.primaryColor,
            ),
            style: AppStyle.mid_large_text.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Dimensions.fontSizeDefault + 1),
            isDense: true,
            value: initValue,
            items: items.map(buildMenuItem).toList(),
            onChanged: (String? value) {
              _changeLang(value: value!);
              setState(() {
                initValue = value;
              });
            },
          )
        ]),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  void _changeLang({required String value}) {
    if (value.toLowerCase() == Language.english.name) {
      Get.find<LanguageController>().changeLanguage("en", "US");
    } else if (value.toLowerCase() == Language.bangla.name) {
      Get.find<LanguageController>().changeLanguage("bn", "BD");
    } else if (value.toLowerCase() == Language.spanish.name) {
      Get.find<LanguageController>().changeLanguage("es", "ES");
    } else {}
  }

  void _getLanguageName() {
    String? languageCode = GetStorage().read("languageCode");
    if (languageCode != null) {
      switch (languageCode) {
        case "en":
          {
            initValue = "English";
            break;
          }
        case "bn":
          {
            initValue = "Bangla";
            break;
          }
        case "es":
          {
            initValue = "Spanish";
            break;
          }
        default:
          initValue = "English";
      }
    }
  }

  _languageDefaultText() {
    return Expanded(
        child: Text(
      AppString.text_language.tr,
      style: AppStyle.small_text_black.copyWith(
          fontSize: Dimensions.fontSizeDefault + 2,
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w400),
    ));
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
}
