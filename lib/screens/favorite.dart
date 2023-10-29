import 'package:e_commerce_app/controller/wishList_controller.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/home_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavoriteScreen extends StatelessWidget {
  final String? title;
  final String? price;
  final String? image;
  final String? cetText;
  final String? description;
  final String? category;
  final dynamic index;
  const FavoriteScreen(
      {super.key,
      this.title,
      this.price,
      this.image,
      this.description,
      this.category,
      this.cetText,
      this.index});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<WishlistController>();
    return Scaffold(
      appBar: appBar(
          context: context,
          text:AppString.text_favourite.tr,
          argumentVal: true,
          notAction: ()=>Get.toNamed(Routes.NOTIFICATION_SCREEN),
          isLeadingHide: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Obx(() => Padding(
            padding: marginLayout,
            child: controller.wishlistIndex.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 6,
                          crossAxisSpacing: 6,mainAxisSpacing: 6
                    ),
                    itemCount: controller.wishlistIndex.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: ()=>_navigator(context,controller,index),
                        child: Card(
                          elevation: 0,
                          shape: roundedRectangleBorder,
                          shadowColor: Colors.grey.withOpacity(0.2),
                          child: Stack(
                            children: [
                              _productViewLayout(
                                  price: controller.wishlistIndex[index].price
                                      .toString(),
                                  context: context,
                                  productName: controller
                                      .wishlistIndex[index].title
                                      .toString(),
                                  status: "BEST SELLER",
                                  placeholder: Images.t_shirt,
                                  image: controller.wishlistIndex[index].image
                                      .toString()),
                              Obx(() => _wishListLayout(index))
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : _emptyCartLayout(context),
          )),
    );
  }

  _emptyCartLayout(context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SizedBox(
                    height: AppLayout.getHeight(160),
                    child: Lottie.asset(Images.no_data))),
            Text(
              AppString.text_no_added_wish_list.tr,
              style: AppStyle.normal_text
                  .copyWith(color: Theme.of(context).hintColor),
            ),
          ],
        ));
  }

  _wishListLayout(index) {
    var controller = Get.find<WishlistController>();

    return Positioned(
      top: 0,
      left: 0,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: AppColor.disableColor.withOpacity(0.2),
        child: GestureDetector(
            onTap: () {
              controller.addToWishListByIndex(
                  id: controller.wishlistIndex[index].id);
              controller.addToWishList(controller.wishlistIndex[index]);
            },
            child: controller.indexArray
                    .contains(controller.wishlistIndex[index].id)
                ? Icon(
                    Icons.favorite,
                    color: AppColor.primaryColor,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: AppColor.normalTextColor,
                  )),
      ),
    );
  }

  _productViewLayout(
      {image, productName, status, required price, placeholder, context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productImage(image: image, placeholder: placeholder),
            _productInfo(
                context: context,
                status: status ?? "",
                price: price ?? "",
                productName: productName ?? ""),
          ],
        ),
      ),
    );
  }

  _productImage({image, placeholder}) {
    return Expanded(
      child: Center(
        child: FadeInImage(
          image: AssetImage(image),
          placeholder: AssetImage(placeholder),
          imageErrorBuilder: (context, error, stackTrace) {
            return SizedBox(
                height: AppLayout.getHeight(110),
                width: AppLayout.getWidth(120),
                child: Image.asset(placeholder));
          },
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  _productInfo({context, status, price, productName}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customSpacerHeight(height: 16),
        Text(
          status ?? "BEST SELLER",
          overflow: TextOverflow.ellipsis,
          style: AppStyle.normal_text.copyWith(
              color: AppColor.primaryColor, overflow: TextOverflow.ellipsis),
        ),
        Text(
          productName,
          overflow: TextOverflow.ellipsis,
          style: AppStyle.normal_text.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.fontSizeMid - 2,
          ),
        ),
        Text(
          "\$$price",
          overflow: TextOverflow.ellipsis,
          style: AppStyle.normal_text.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimensions.fontSizeMid - 2),
        ),
      ],
    );
  }
}

Future _navigator(context,controller,index){
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetails(
          title:controller.wishlistIndex[index]. title.toString(),
          drc: controller.wishlistIndex[index].description.toString(),
          cetText: controller.wishlistIndex[index].category.toString(),
          price: controller.wishlistIndex[index].price.toString(),
          image: controller.wishlistIndex[index].image,
          index: index,
        ),
      ));
}