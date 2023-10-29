
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_layout.dart';
import '../utils/dimensions.dart';

TextStyle get countyTextStyle {
  return const TextStyle(fontSize: 16, color: AppColor.normalTextColor);
}
BorderRadius get countyFieldRadius {
  return BorderRadius.only(
    topLeft: Radius.circular(Dimensions.radiusMid),
    topRight: Radius.circular(Dimensions.radiusMid),
  );
}
InputDecoration get countryDecoration {
  return InputDecoration(
      hintText: AppString.text_search,
      isDense: true,
      focusedBorder:
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      border:
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)));
}

Widget countyField(
    {context,
      onAction,
      String? Function(String?)? validator,
      required TextEditingController controller}) {
  return Card(
    color: Theme.of(context).hintColor.withOpacity(0.1),
    elevation: 0,
    shape: cardStyle,
    shadowColor: Colors.grey.withOpacity(0.2),
    child: SizedBox(
      height: AppLayout.getHeight(58),
      child: TextFormField(
        validator: validator,
        controller: controller,
        readOnly: true,
        onTap: () => onAction(),
        decoration: InputDecoration(
          hintText: AppString.text_select_county.tr,
          hintStyle: GoogleFonts.poppins(
            color: Theme.of(context).hintColor,
          ),
          suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: Theme.of(context).hintColor,),
          focusColor: Theme.of(context).primaryColor,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(
                  Dimensions.radiusDefault + 7)),
        ),
      ),
    ),
  );

}

RoundedRectangleBorder get cardStyle {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusMid));
}