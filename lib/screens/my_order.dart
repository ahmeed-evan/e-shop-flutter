import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: _backArrowButton(context),
          backgroundColor: Theme.of(context).backgroundColor,
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.label,
            splashBorderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            unselectedLabelColor: Theme.of(context).hintColor,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            isScrollable: true,
            labelStyle: AppStyle.normal_text_black
                .copyWith(fontSize: Dimensions.fontSizeMid - 2),
            tabs: [
              Tab(
                  child: Text(
                AppString.text_deliverd.tr,
              )),
              Tab(
                  child: Text(
                AppString.text_processing.tr,
              )),
              Tab(child: Text(AppString.text_canceld.tr)),
            ],
          ),
        ),
        body: _tabBarLayoutView,
      ),
    );
  }
}

TabBarView get _tabBarLayoutView {
  return TabBarView(
    children: [
      _itemDeliveredView(),
      _itemProcessingView(),
      _itemCanceledView(),

    ],
  );
}

_itemDeliveredView() {
  return ListView.builder(itemBuilder: (context, index) {
    return SizedBox(
      child: Padding(
        padding: marginLayout.copyWith(bottom: AppLayout.getHeight(6),top: AppLayout.getHeight(6)),
        child: Card(
          elevation: 0,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape: _cardStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _orderIdLayout(context),
              Divider(thickness: 2,color: Theme.of(context).hintColor.withOpacity(0.2),),
            _amountLayout(context), _deliveryStatus(context),
              customSpacerHeight(height: 18),

            ],
          ),
        ),
      ),
    );
  },);
}
_deliveryStatus(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: AppLayout.getHeight(35),
        width: AppLayout.getHeight(80),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.radiusDefault),topRight: Radius.circular(Dimensions.radiusDefault)),
        ),
        child: Center(child: Text(AppString.text_details,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).cardColor),)),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 14.0),
        child: Text(AppString.text_deliverd,style: AppStyle.normal_text_black.copyWith(color: AppColor.successColor,fontSize: Dimensions.fontSizeMid-3,fontWeight: FontWeight.w300),),
      )
    ],
  );
}



_itemProcessingView() {
  return ListView.builder(itemBuilder: (context, index) {
    return SizedBox(
      child: Padding(
        padding: marginLayout.copyWith(bottom: AppLayout.getHeight(6),top: AppLayout.getHeight(6)),
        child: Card(
          elevation: 0,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape: _cardStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _orderIdLayout(context),
              Divider(thickness: 2,color: Theme.of(context).hintColor.withOpacity(0.2),),
              _amountLayout(context),
              _processingStatus(context),

              customSpacerHeight(height: 18),

            ],
          ),
        ),
      ),
    );
  },);
}
_processingStatus(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: AppLayout.getHeight(35),
        width: AppLayout.getHeight(80),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.radiusDefault),topRight: Radius.circular(Dimensions.radiusDefault)),
        ),
        child: Center(child: Text(AppString.text_details.tr,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).cardColor),)),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 14.0),
        child: Text(AppString.text_processing.tr,style: AppStyle.normal_text_black.copyWith(color: Colors.orange.shade500,fontSize: Dimensions.fontSizeMid-3,fontWeight: FontWeight.w300),),
      )
    ],
  );
}

_itemCanceledView() {
  return ListView.builder(itemBuilder: (context, index) {
    return SizedBox(
      child: Padding(
        padding: marginLayout.copyWith(bottom: AppLayout.getHeight(6),top: AppLayout.getHeight(6)),
        child: Card(
          elevation: 0,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape: _cardStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _orderIdLayout(context),
              Divider(thickness: 2,color: Theme.of(context).hintColor.withOpacity(0.2),),
              _amountLayout(context),
              _canceledStatus(context),

              customSpacerHeight(height: 18),

            ],
          ),
        ),
      ),
    );
  },);
}
_canceledStatus(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: AppLayout.getHeight(35),
        width: AppLayout.getHeight(80),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.radiusDefault),topRight: Radius.circular(Dimensions.radiusDefault)),
        ),
        child: Center(child: Text(AppString.text_details,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).cardColor),)),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 14.0),
        child: Text(AppString.text_canceld,style: AppStyle.normal_text_black.copyWith(color: AppColor.errorColor,fontSize: Dimensions.fontSizeMid-3,fontWeight: FontWeight.w300),),
      )
    ],
  );
}

_amountLayout(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12,bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(AppString.text_quantity,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).hintColor.withOpacity(0.7),fontSize: Dimensions.fontSizeMid-2),),
            Text("04",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeMid-2),),
          ],
        ),
        Text(AppString.text_total_ammount,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).hintColor.withOpacity(0.7),fontSize: Dimensions.fontSizeMid-2),),
        Text("\$564",style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeMid-2,fontWeight: FontWeight.bold),),


      ],
    ),
  );
}

_orderIdLayout(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12,bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppString.text_order_id,style: AppStyle.normal_text_black.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeMid-2),),
        Text("20/04/2019",style: AppStyle.mid_large_text.copyWith(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),fontSize: Dimensions.fontSizeMid-2,fontWeight: FontWeight.w300),),

      ],
    ),
  );
}
RoundedRectangleBorder get _cardStyle {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusMid-3));
}

_backArrowButton(context) {
  return Padding(
    padding: EdgeInsets.only(left: AppLayout.getWidth(20)),
    child: GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: AppLayout.getHeight(40),
        width: AppLayout.getWidth(40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),
        child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.onPrimary,
              size: Dimensions.fontSizeMid - 3,
            )),
      ),
    ),
  );
}