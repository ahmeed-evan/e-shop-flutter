import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/screens/write_a_review.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/utils.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/home_view_widgets.dart';
import '../widgets/selected_county_widget.dart';

class ProductReview extends StatelessWidget {
  final dynamic title;
  final dynamic price;
  final dynamic image;
  final dynamic rating;
  final dynamic drc;
  const ProductReview({
    super.key,
    this.title,
    this.price,
    this.image,
    this.rating,
    this.drc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar(
            context: context,
            text: AppString.text_product_review.tr,
            argumentVal: true,
            notAction: () => Get.toNamed(Routes.NOTIFICATION_SCREEN)),
        body: Padding(
          padding: marginLayout,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _productReviewLayout(
                    context: context,
                    title: title,
                    image: image,
                    price: price,
                    rating: rating),
                customSpacerHeight(height: 20),
                _productReviewUserList(context)
              ],
            ),
          ),
        ),
        floatingActionButton: _writeReview(context: context, drc: drc, title: title, image: image));
  }

  _productReviewLayout({context, title, price, rating, image}) {
    return SizedBox(
      child: Card(
        elevation: 0,
        shape: roundedRectangleBorder,
        shadowColor: Colors.grey.withOpacity(0.2),
        child: Row(
          children: [
            _productImage(context: context, image: image),
            _itemInfoLayout(context: context, rating: rating, price: price, title: title, drc: drc),
          ],
        ),
      ),
    );
  }

  _productImage({context, image}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
            elevation: 0,
            shape: roundedRectangleBorder,
            color: Theme.of(context).hintColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(Images.t_shirt),
            )),
      ),
    );
  }

  _itemInfoLayout({context, title, price, rating, drc}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: AppStyle.normal_text_black.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                overflow: TextOverflow.ellipsis),
          ),
          customSpacerHeight(height: 3),
          _review(context: context, rating: rating),
          customSpacerHeight(height: 3),
          customSpacerHeight(height: 6),
          _viewerCount(context: context)
        ],
      ),
    );
  }

  _review({context, rating}) {
    return Row(
      children: [
        Center(
          child: Wrap(
            children: List.generate(1, (index) {
              return Icon(
                Icons.star,
                color: Colors.orange,
                size: Dimensions.fontSizeMid,
              );
            }),
          ),
        ),
        customSpacerWidth(width: 6),
        Text(
          '($rating)',
          style: AppStyle.mid_large_text.copyWith(
              color: Theme.of(context).hintColor,
              fontSize: Dimensions.fontSizeMid - 5),
        ),
        customSpacerWidth(width: 2),
      ],
    );
  }

  _viewerCount({context}) {
    return Text(
      "10 reviews",
      style: AppStyle.normal_text_black.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: Dimensions.fontSizeMid - 2,
          overflow: TextOverflow.ellipsis),
    );
  }

  _productReviewUserList(context) {
    return ListView.builder(
      itemCount: username.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
          child: Stack(
            children: [
              _userReviewInfoAndDescription(context: context,index: index),
              Positioned.fill(
                  top: -6,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: CircleAvatar(
                        radius: 19,
                        backgroundImage: AssetImage(Images.user),
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }

  _descriptionTextLayout(BuildContext context) {
    return Padding(
      padding: marginLayout.copyWith(bottom: AppLayout.getHeight(8)),
      child: Text(
        "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price",
        style: AppStyle.mid_large_text.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: Dimensions.fontSizeDefault - 1),
      ),
    );
  }

  _reviewView(BuildContext context) {
    return Padding(
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
                return Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: Dimensions.fontSizeMid,
                );
              },
            ),
          ),
          Text(
            "20/04/19",
            style: AppStyle.normal_text_black.copyWith(
                color: Theme.of(context).hintColor,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.fontSizeDefault - 2),
          )
        ],
      ),
    );
  }

  FloatingActionButton _writeReview({context, title, image, drc}) {
    return FloatingActionButton.extended(
      backgroundColor: AppColor.primaryColor,
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WriteAReview(
              title: title,
              image: image,
              drc: drc,
            ),
          )),
      icon: const Icon(
        Icons.mode_edit_outlined,
        color: AppColor.cardColor,
      ),
      label: Text(
        AppString.text_write_a_review.tr,
        style: AppStyle.normal_text_black.copyWith(color: AppColor.cardColor),
      ),
    );
  }


  _userReviewInfoAndDescription({context,index}) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: AppLayout.getHeight(10)),
        child: Card(
          shape: cardStyle,
          elevation: 0,
          shadowColor: Colors.grey.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _reviewView(context),
              customSpacerHeight(height: 8),
              Padding(
                padding: marginLayout,
                child: Text(
                  username[index],
                  style: AppStyle.normal_text_black.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              customSpacerHeight(height: 6),
              _descriptionTextLayout(context),
            ],
          ),
        ),
      ),
    );
  }
}
