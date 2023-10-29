import 'package:e_commerce_app/controller/input_controller.dart';
import 'package:e_commerce_app/controller/product_loaded_controller.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_snakbar.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/home_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/add_to_cart_controller.dart';
import '../controller/wishList_controller.dart';
import '../utils/app_string.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, text: AppString.text_view_all.tr, argumentVal: true,notAction: ()=>Get.toNamed(Routes.NOTIFICATION_SCREEN)),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding:margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchFieldLayout(context),
            customSpacerHeight(height: 12),
            _allItemsListLayout(context),
            customSpacerHeight(height: 12),

          ],
        ),
      ),
    );
  }

  _searchFieldLayout(context) {
    return Row(
      children: [
        Expanded(
            child: AppInputField(
              onAction: () => Get.toNamed(Routes.SEARCH_SCREEN),
              title: AppString.text_search.tr,
              hint: AppString.text_enter_search.tr,
              controller: InputController().searchController,
              isFieldTitleHide: true,
              isReadVal: true,
            )),
        _filterLayout(Theme.of(context).primaryColor, AppColor.cardColor),
      ],
    );
  }

  _filterLayout(bgColor, iconColor) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.FILTER_SCREEN),
        child: CircleAvatar(
          radius: 28,
          backgroundColor: AppColor.primaryColor,
          child: SizedBox(
              height: AppLayout.getHeight(24),
              child: Lottie.asset(Images.filter)),
        ),
      ),
    );
  }


  _allItemsListLayout(context) {
    return Expanded(
      child: FutureBuilder(
        future: ProductLoaded().loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.data ??""}"),
            );
          } else if (snapshot.hasData) {
            var items = snapshot.data as List<ProductModel>;
            return GridView.builder(
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:5/6,
                  crossAxisSpacing: 6,mainAxisSpacing: 6

              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0,
                  shape: roundedRectangleBorder,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  child: Stack(
                    children: [

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:  (context)=>  ProductDetails(
                            title: items[index].title.toString(),
                            drc: items[index].description.toString(),
                            cetText: items[index].category.toString(),
                            price: items[index].price.toString(),
                            image: items[index].image,
                            index: index,
                          ),));
                        },
                        child: _productViewLayout(
                            image: items[index].image??"",
                            price: items[index].price??"",
                            productName: items[index].title ??"",
                            placeholder:items[index].image??"",
                          context: context
                        ),
                      ),

                      Obx(() => _wishListLayout(index,items[index])),
                      _addItemLayout(context,items[index]),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  _wishListLayout(index, ProductModel items) {
    var controller = Get.find<WishlistController>();
    return Positioned(
      top: 8,
      left: 8,
      child: GestureDetector(
          onTap: () {
            controller.addToWishList(items);
            controller.addToWishListByIndex(id: items.id);
          },
          child: controller.indexArray.contains(items.id)
              ? Icon(
            Icons.favorite,
            color: AppColor.primaryColor,
          )
              : const Icon(Icons.favorite_border)),
    );
  }


  _addItemLayout(context,items) {
    return Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {
            Get.find<AddToCartController>().totalPrice.value =
                Get.find<AddToCartController>().totalPrice.value +
                    items.price;
            Get.find<AddToCartController>().addToCart(
                productModel: items, context: context);
            showToast(context: context, text: AppString.text_succesful.tr,subtext: AppString.text_cart_add_succesful.tr);
          },
          child: Card(
            color: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radiusLarge),
                    bottomRight: Radius.circular(Dimensions.radiusMid - 4))),
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(
                Icons.add,
                color: AppColor.cardColor,
              ),
            ),
          ),
        ));
  }

  _productViewLayout({image, productName, status, required price,placeholder,context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productImage(image: image,placeholder:placeholder,context: context),
          _productInfo(
              context: context,
              status: status,
              price: price,
              productName: productName,

          ),
        ],
      ),
    );
  }
  _productImage({image,placeholder,context}){
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: FadeInImage(
          image: AssetImage(image),
          placeholder: AssetImage(placeholder),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(placeholder);
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
