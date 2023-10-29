import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/images.dart';
import '../widgets/home_view_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _notificationAppbar(context),
      body: Padding(
        padding: marginLayout,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _recentText(context),
              customSpacerHeight(height: 12),
              _notificationListViewLayout(context),
              customSpacerHeight(height: 12),
              _yestDayDayText(context),
              customSpacerHeight(height: 12),
              _notificationListViewLayout(context),
              customSpacerHeight(height: 56),
            ],
          ),
        ),
      ),
    );
  }

  _notificationAppbar(context) {
    return appBar(
        context: context,
        text: AppString.text_notification.tr,
        argumentVal: true,
        iconW: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.delete,
              color: Theme.of(context).colorScheme.onPrimary,
            )));
  }

  _recentText(context) {
    return Text(
      AppString.text_recent.tr,
      style: AppStyle.normal_text_black.copyWith(
        fontSize: Dimensions.fontSizeMid - 2,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  _productImage(context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
          elevation: 0,
          shape: roundedRectangleBorder,
          color: Theme.of(context).hintColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(Images.t_shirt),
          )),
    );
  }

  _itemInfoLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _timeLayout(context),
          Text(
            "We Have New\nProduct With Offers",
            style: AppStyle.normal_text_black.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                overflow: TextOverflow.ellipsis),
          ),
          customSpacerHeight(height: 3),
          _priceLayout(context)
        ],
      ),
    );
  }

  _priceLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$346",
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              overflow: TextOverflow.ellipsis),
        ),
        customSpacerWidth(width: 28),
        Text(
          "\$646",
          style: AppStyle.mid_large_text.copyWith(
              color: Theme.of(context).hintColor,
              fontSize: Dimensions.fontSizeMid - 4,
              overflow: TextOverflow.ellipsis,
              decoration: TextDecoration.lineThrough),
        ),
      ],
    );
  }

  _timeLayout(context) {
    return Row(
      children: [
        customSpacerWidth(width: 20),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3),
          child: Text(
            "07 mint ago",
            style: AppStyle.normal_text_black.copyWith(
                color: Theme.of(context).hintColor,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }

  _yestDayDayText(context) {
    return Text(
      AppString.text_yesterday.tr,
      style: AppStyle.normal_text_black
          .copyWith(fontSize: Dimensions.fontSizeMid - 2,        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  _notificationListViewLayout(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          background: const Card(
            color: AppColor.errorColor,
            child: Icon(
              CupertinoIcons.delete,
              color: AppColor.cardColor,
            ),
          ),
          key: UniqueKey(),
          child: SizedBox(
            height: AppLayout.getHeight(105),
            child: Card(
              elevation: 0,
              shape: roundedRectangleBorder,
              shadowColor: Colors.grey.withOpacity(0.2),
              child: Row(
                children: [_productImage(context), _itemInfoLayout(context)],
              ),
            ),
          ),
        );
      },
    );
  }
}
