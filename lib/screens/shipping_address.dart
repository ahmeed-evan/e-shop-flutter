import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/selected_county_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_string.dart';
import '../utils/app_style.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _addShippingAppbar(context),
      body: Padding(
        padding: marginLayout,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _shippingAddressListLayout(context)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).cardColor,
          onPressed: ()=>Get.toNamed(Routes.ADD_SHPPING_ADDRESS),child:  Icon(Icons.add,color: Theme.of(context).colorScheme.onPrimary,)),
    );
  }

  _addShippingAppbar(context) {
    return appBar(
      context: context,
      text: AppString.text_shpping_address.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }

  _shippingAddressListLayout(BuildContext context) {
    var currentIndex=0.obs;
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding:  const EdgeInsets.only(bottom: 8.0,top: 8),
            child: Obx(() => GestureDetector(
              onTap: () => currentIndex.value = index,
              child: Column(
                children: [
                  Row(
                    children: [
                      currentIndex.value==index?
                      Icon(Icons.check_box,color: AppColor.primaryColor,): const Icon(Icons.check_box_outline_blank,color: AppColor.hintColor,),
                      customSpacerWidth(width: 8),
                      Text(AppString.text_use_as_the_shipping_address.tr,style: AppStyle.normal_text_black.copyWith(color:currentIndex.value==index? Theme.of(context).colorScheme.onPrimary:Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),fontSize: Dimensions.fontSizeMid-1,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w400),)
                    ],
                  ),

                  customSpacerHeight(height: 12),

                  _addressLayout(context,index)



                ],
              ),
            )),
          );
        },),
    );
  }

  _addressLayout(BuildContext context, int index) {
    return Card(
      shape: cardStyle,
      elevation: 0,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: marginLayout.copyWith(top: 12,bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bruno Federates",style: AppStyle.title_text.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeMid),),
                GestureDetector(
                    onTap: ()=>Get.toNamed(Routes.EDIT_SHIPPING_ADDRESS),
                    child: const Icon(Icons.mode_edit_outline_outlined))
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: marginLayout.copyWith(bottom: 12),
            child: Text("478 Paris Hill Ave.Fort Mill, SC 29708\nParis Hill Ave.Fort Mill, SC 29708, Paris Hill Ave.Fort Mill, SC 29708",style: AppStyle.mid_large_text.copyWith(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),fontSize: Dimensions.fontSizeMid-3),),
          ),
          customSpacerHeight(height: 12)
        ],
      ),
    );
  }
}
