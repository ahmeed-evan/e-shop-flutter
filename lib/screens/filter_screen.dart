import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';
import '../utils/dimensions.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _minPrice = 0.0;

  double _maxPrice = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _myFilterAppbar(context),
      body:  Column(
        children: [
          customSpacerHeight(height: 20),
          _priceRangeSliderLayout(context),
          customSpacerHeight(height: 26),

          _itemColorPlated(),
          customSpacerHeight(height: 26),

          _itemSizeLayout(context),
          customSpacerHeight(height: 26),

          _itemCategoryIndex(context),
         _applyButtonLayout(context),
          customSpacerHeight(height: 16),



          ],
      ),
    );
  }

  _myFilterAppbar(context) {
    return appBar(
      context: context,
      text: AppString.text_filter.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }

  _priceRangeSliderLayout(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Column(
        children: [
          Padding(
            padding: marginLayout.copyWith(bottom: 8,top: 8,left: 8,right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$$_minPrice",style: AppStyle.normal_text.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                Text("\$$_maxPrice",style: AppStyle.normal_text.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
              ],
            ),
          ),
          _rangeSliderLayout(context)
        ],
      ),
    );
  }



  _itemColorPlated() {
    RxInt selectedColors = 0.obs;
    return Card(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: AppLayout.getHeight(60),
        child: Obx(() =>
            Center(
              child: Wrap(
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => selectedColors.value = index,
                      child: CircleAvatar(
                        backgroundColor:
                        index == 0
                            ? AppColor.errorColor
                            : index == 1
                            ? AppColor.successColor:
                        index==2?AppColor.disableColor.withOpacity(0.9):
                            index==3?AppColor.secondaryColor:
                                index==4?Colors.grey

                            : Colors.orange,
                        child: selectedColors == index
                            ? const Icon(
                          Icons.done,
                          color: AppColor.cardColor,
                        )
                            : Container(),
                      ),
                    ),
                  );
                }),
              ),
            )


        ),
      ),
    );}

  _itemSizeLayout(BuildContext context) {
    RxInt _currentIndex = 0.obs;
    List sizeIndex=[
      "XS","S","M","L","XL"
    ].obs;

    return Card(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: AppLayout.getHeight(60),
        child: Obx(() =>
            Center(
              child: Wrap(
                children: List.generate(sizeIndex.length, (index) {
                  return Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => _currentIndex.value = index,
                      child: SizedBox(
                        height: 46,
                        width: 60,
                        child: Card(
                            elevation: 0,
                            shadowColor: Colors.grey.withOpacity(0.2),
                            color: _currentIndex.value==index?AppColor.primaryColor:AppColor.cardColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault),side: BorderSide(width: 1,color: Theme.of(context).primaryColor)),
                            child: Center(child: Text(sizeIndex[index],style: AppStyle.normal_text.copyWith(color: _currentIndex.value==index?AppColor.cardColor:AppColor.normalTextColor,),))),
                      ),
                    ),
                  );
                }),
              ),
            )),
      ),
    );
  }


  _itemCategoryIndex(BuildContext context) {
    RxInt _currentIndex = 0.obs;
    List sizeIndex=[
      "All","Women","Men","Xman","Mies's"
    ].obs;

    return Expanded(
      child: Card(
        elevation: 3,
        shadowColor: Colors.grey.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: SizedBox(
          child:
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2/1,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4
                ),
                itemCount: sizeIndex.length,
                itemBuilder: (BuildContext context,  index) {

                return  Obx(() => Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => _currentIndex.value = index,
                    child: SizedBox(
                      height: 46,
                      width: 80,
                      child: Card(
                          elevation: 0,
                          shadowColor: Colors.grey.withOpacity(0.2),
                          color: _currentIndex.value==index?AppColor.primaryColor:AppColor.cardColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault),side: BorderSide(width: 1,color: Theme.of(context).primaryColor)),
                          child: Center(child: Text(sizeIndex[index],style: AppStyle.normal_text.copyWith(color: _currentIndex.value==index?AppColor.cardColor:AppColor.normalTextColor,),))),
                    ),
                  ),
                ));
                },





      ),
        ),
      ),
    );
  }

  _applyButtonLayout(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppButton(buttonText: AppString.text_apply, onPressed: ()=>Get.toNamed(Routes.MAIN), buttonColor: AppColor.primaryColor,isButtonExpanded: false,),
    );
  }

  _rangeSliderLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FlutterSlider(
        values: [_minPrice, _maxPrice],
        rangeSlider: true,
        max: 500.0, // Set the maximum price
        min: 0.0,
        minimumDistance: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        onDragging: (handlerIndex, lowerValue, upperValue) {
          _minPrice = lowerValue;
          _maxPrice = upperValue;
          setState(() {});
        },
      ),
    );
  }

}
