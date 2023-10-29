import 'package:e_commerce_app/controller/add_to_cart_controller.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/screens/product_review.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/view_details_readmore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/wishList_controller.dart';
import '../widgets/custom_snakbar.dart';

class ProductDetails extends StatefulWidget {
  final String? title;
  final String? drc;
  final String? price;
  final String? image;
  final String? cetText;
  final dynamic index;
  final dynamic id;
  final dynamic rating;
  const ProductDetails(
      {super.key,
      this.title,
      this.drc,
      this.price,
      this.image,
      this.id,
      this.rating=5,
      this.cetText,
      this.index});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    final List indexImage = [
      "${widget.image}",
      Images.t_shirt_2,
      Images.t_shirt,
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _productDetailsAppbar(context),
      body: Padding(
        padding: marginLayout,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customSpacerHeight(height: 14),

                _productTitleTextLayout(context: context, text: widget.title, subtext: widget.cetText, price: widget.price, rating: widget.rating, image: widget.image, drc: widget.drc),

                Obx(
                  () => _productImageLayout(currentIndex.value == 0
                      ? widget.image
                      : currentIndex.value == 1
                          ? Images.t_shirt_2
                          : currentIndex.value == 2
                              ? Images.t_shirt
                              : widget.image),
                ),
                customSpacerHeight(height: 28),
                _selectedProductImage(context: context, indexImage: indexImage),
                customSpacerHeight(height: 28),
                _productDescriptionText(drcText: widget.drc),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _addToCartButtonLayout(
                      context: context,
                      onAction: () {
                        Get.find<AddToCartController>().addToCart(
                            productModel: widget.index, context: context);
                        showToast(
                            context: context,
                            subtext: AppString.text_cart_add_succesful.tr,
                            text: AppString.text_succesful.tr);
                      },
                      index: widget.index),
                ),
                const Spacer(),
                customSpacerHeight(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _productTitleTextLayout({text, subtext, context, price, rating, image,drc}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyle.title_text
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        _productReview(
            context: context,
            rating: rating,
            price: price,
            image: image,
            drc: drc,
            title: text),
        Text(
          subtext,
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).hintColor,
              fontSize: Dimensions.fontSizeMid - 2),
        ),
        customSpacerHeight(height: 8),
        Text(
          "\$$price",
          style: AppStyle.title_text.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimensions.fontSizeMid + 6),
        ),
      ],
    );
  }

  _wishListLayout(index, context) {
    var controller = Get.find<WishlistController>();
    return CircleAvatar(
      radius: 26,
      backgroundColor: Theme.of(context).hintColor.withOpacity(0.1),
      child: controller.indexArray.contains(index)
          ? Icon(
              Icons.favorite,
              color: AppColor.primaryColor,
            )
          : Icon(
              Icons.favorite_border,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
    );
  }

  _addToCartButtonLayout({context, onAction, index}) {
    return Row(
      children: [
        Obx(() => _wishListLayout(index, context)),
        customSpacerWidth(width: 50),
        AppButton(
          buttonText: AppString.text_add_to_cart.tr,
          onPressed: onAction,
          buttonColor: AppColor.primaryColor,
          textColor: AppColor.cardColor,
          iconsData: Icons.shopping_cart_outlined,
        )
      ],
    );
  }

  _productDescriptionText({drcText}) {
    final wordCount = drcText.split(' ').length;

    return wordCount > 10
        ? ExpandedText(
            text: drcText,
          )
        : Text(
            drcText,
            style: AppStyle.normal_text_black
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          );
  }

  _productImageLayout(url) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: FadeInImage(
          image: AssetImage(url),
          placeholder: AssetImage(url),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(url);
          },
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  _selectedProductImage({context, indexImage}) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 9.5,
        child: ListView.builder(
          itemCount: indexImage.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    currentIndex.value = index;
                  },
                  child: currentIndex.value == index
                      ? _selected(indexImage, index)
                      : Card(
                          elevation: 0,
                          shadowColor: Colors.grey.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusDefault)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 12, bottom: 12),
                            child: SizedBox(
                                child: Image.asset(
                              indexImage[index],
                              fit: BoxFit.contain,
                            )),
                          ),
                        ),
                ));
          },
        ),
      ),
    );
  }

  _selected(indexImage, index) {
    return Card(
      elevation: 0,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 12, bottom: 12),
        child: SizedBox(
            child: Image.asset(
          indexImage[index],
          fit: BoxFit.contain,
        )),
      ),
    );
  }

  _productReview({context, rating, title, price, image,drc}) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductReview(
              title: title,
              price: price,
              image: image,
              rating: rating,
              drc: drc,

            ),
          )),
      child: Row(
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
            rating.toString(),
            style: AppStyle.normal_text_black.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Dimensions.fontSizeMid - 5),
          ),
          customSpacerWidth(width: 6),

          Text(
            '( 567 reviews)',
            style: AppStyle.mid_large_text.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                fontSize: Dimensions.fontSizeMid - 5),
          ),

        ],
      ),
    );
  }

  _productDetailsAppbar(BuildContext context) {
    return appBar(context: context, text: widget.title, argumentVal: true, notAction: () => Get.toNamed(Routes.NOTIFICATION_SCREEN));
  }
}
