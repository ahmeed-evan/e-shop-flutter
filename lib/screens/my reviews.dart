import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/selected_county_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home_view_widgets.dart';
class MyReviewScreen extends StatelessWidget {
  const MyReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _myCartAppbar(context),
      body: Padding(
        padding: marginLayout,
        child: Column(
          children: [
            _reviewListLayout(context),
            customSpacerHeight(height: 12),
          ],
        ),
      ),
    );
  }
  _myCartAppbar(context) {
    return appBar(
      context: context,
      text: AppString.text_my_review.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }

  _reviewListLayout(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder:  (context, index) {
        return Padding(
          padding:  EdgeInsets.only(bottom: AppLayout.getHeight(8)),
          child: Card(
            shape: cardStyle,
            elevation: 0,
            shadowColor: Colors.grey.withOpacity(0.2),
            child: Column(
              children: [
              _productInfoLayout(context),
               _reviewStarLayout(context),
                customSpacerHeight(height: 8),

                _descriptionLayout(context)


              ],
            ),),
        );
      },),
    );
  }
  _productInfoLayout(BuildContext context) {
    return Row(
      children: [
        _productImage(context),
        customSpacerWidth(width: 12),
        _itemInfoLayout(context),
      ],
    );
  }

  _productImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: AppLayout.getHeight(86),
        width: AppLayout.getWidth(86),
        child: Card(
            elevation: 0,
            shape: roundedRectangleBorder,
            color:  context.isDarkMode? Theme.of(context).backgroundColor: Theme.of(context).hintColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(Images.t_shirt),
            )),
      ),
    );
  }

  _itemInfoLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Men' fashion",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),overflow: TextOverflow.ellipsis),),
        Text("\$50.00",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w900,overflow: TextOverflow.ellipsis),)
      ],
    );
  }
  _descriptionLayout(BuildContext context) {
    return Padding(
      padding: marginLayout.copyWith(bottom: AppLayout.getHeight(8)),
      child: Text("Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price",style: AppStyle.mid_large_text.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeDefault-1),),
    );
  }

  _reviewStarLayout(BuildContext context) {
    return  Padding(
      padding: marginLayout,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 26,
            width: 100,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Icon(Icons.star,color: Colors.orange,size: Dimensions.fontSizeMid,);
              },),
          ),
          Text("20/04/19",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).hintColor,fontWeight: FontWeight.w300,fontSize: Dimensions.fontSizeDefault-2),)
        ],
      ),
    );
  }



}
