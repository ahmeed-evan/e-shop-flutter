import 'package:country_picker/country_picker.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_snakbar.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/county_pickar_controller.dart';
import '../controller/input_controller.dart';
import '../utils/app_color.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';
import '../utils/utils.dart';
import '../widgets/selected_county_widget.dart';

class AddShippingAddress extends StatelessWidget {
   AddShippingAddress({super.key});
  final DropdownController controller = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _addShippingAddressAppbar(context),
      body: Padding(
        padding: marginLayout,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                customSpacerHeight(height: 12),

                AppInputField(title: AppString.text_full_name.tr, hint: AppString.text_enter_your_name.tr,isFieldElevationHide: true,),
                customSpacerHeight(height: 12),

                AppInputField(title: AppString.text_address.tr, hint: AppString.text_enter_address.tr,isFieldElevationHide: true,),
                customSpacerHeight(height: 12),

                AppInputField(title: AppString.text_zip_code.tr, hint: AppString.text_enter_zipcode.tr,isFieldElevationHide: true,),
                customSpacerHeight(height: 12),
                _countyFieldLayout(context: context,title: AppString.text_select_county.tr),
                customSpacerHeight(height: 12),
                Obx(() {return _cityFieldLayout(context);}),
                const Spacer(),
                AppButton(onPressed: (){
                  showToast(context: context,text:AppString.text_succesful.tr,subtext: AppString.text_your_address_add_succesful.tr);
                  Get.toNamed(Routes.MAIN);

                }, buttonText: AppString.text_save_address, buttonColor: AppColor.primaryColor,isButtonExpanded: false,),
                const Spacer(),
                customSpacerHeight(height: 60),

              ],
            ),
          ),
        ),
      ),
    );
  }
  _addShippingAddressAppbar(context) {
    return appBar(
      context: context,
      text: AppString.text_add_shpping_address.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }

  _countyFieldLayout({context,title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: _titleStyle(
               Theme.of(context).colorScheme.onPrimary
            )),
        customSpacerHeight(height: 8),
        countyField(
          context: context,
          controller: Get.find<InputController>().addCountyController,
          onAction: () {
            showCountryPicker(
                context: context,
                countryListTheme: CountryListThemeData(
                  flagSize: 24,
                  backgroundColor: AppColor.cardColor,
                  textStyle: countyTextStyle,
                  bottomSheetHeight: AppLayout.getHeight(554),
                  borderRadius: countyFieldRadius,
                  inputDecoration: countryDecoration,
                ),
                onSelect: (Country country) {
                  Get.find<CountryPickerController>().setSelectedCountry(country.name);
                });
          },
        ),
      ],
    );
  }

  Widget _cityFieldLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.text_City,
            style: _titleStyle(
                Theme.of(context).colorScheme.onPrimary
            )),
        customSpacerHeight(height: 8),
        Card(
          color: Theme.of(context).hintColor.withOpacity(0.1),
          elevation: 0,
          shape: cardStyle.copyWith(),
          shadowColor: Colors.grey.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 12,top: 6,bottom: 6),
            child: DropdownButton<String>(
              value: controller.selectedValue.value,
              icon: Icon(Icons.keyboard_arrow_down_outlined,color: Theme.of(context).hintColor,),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              underline: Container(),
              isExpanded: true,
              onChanged: (newValue) {
                controller.setSelectedValue(newValue!);
              },
              items: countyList.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }


}

TextStyle _titleStyle(color) {
  return AppStyle.mid_large_text.copyWith(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: Dimensions.fontSizeDefault + 2);
}
class DropdownController extends GetxController {
  var selectedValue = 'New York'.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
