import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/dotted_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/add_to_cart_controller.dart';
import '../utils/app_string.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/home_view_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar(
            context: context,
            text: AppString.text_my_cart.tr,
            argumentVal: true,
            isLeadingHide: true,
            isNotificationHide: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => _totalItemCount(),
            ),
            customSpacerHeight(height: 12),
            Obx(
              () => _addItemLayout(context),
            ),
            Obx(() => Get.find<AddToCartController>().addToArray.isNotEmpty
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: _productCheckoutLayout(context),
                  )
                : Container())
          ],
        ));
  }

  _totalItemCount() {
    var controller = Get.find<AddToCartController>();

    return Padding(
      padding: marginLayout,
      child: Text(
          controller.addToArray.isNotEmpty
              ? "${controller.addToArray.length} ${AppString.text_items}"
                  .toString()
              : "0 ${AppString.text_items}",
          style: AppStyle.normal_text_black.copyWith(
              fontSize: Dimensions.fontSizeMid - 2,
              color: Theme.of(context).colorScheme.onPrimary)),
    );
  }

  _addItemLayout(context) {
    var controller = Get.find<AddToCartController>();
    return controller.addToArray.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: controller.addToArray.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: marginLayout.copyWith(bottom: 8),
                  child: Dismissible(
                    direction: DismissDirection.endToStart,
                    onDismissed: (DismissDirection direction) {
                      controller.removeToCart(
                          context: context,
                          productModel: controller.addToArray[index]);
                    },
                    background: _deletedIconLayout(),
                    key: UniqueKey(),
                    child: GestureDetector(
                      onTap: () => navigator(context: context, index: index),
                      child: Card(
                        elevation: 0,
                        shape: roundedRectangleBorder,
                        shadowColor: Colors.grey.withOpacity(0.2),
                        child: SizedBox(
                          height: AppLayout.getHeight(110),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customSpacerWidth(width: 10),
                              _productImageLayout(
                                  context, controller.addToArray[index].image),
                              customSpacerWidth(width: 22),
                              _productInfoLayout(
                                  context: context,
                                  productTitle:
                                      controller.addToArray[index].title,
                                  price: controller.addToArray[index].price),
                              const Spacer(),
                              Obx(() => _productQuantityLayout(
                                  context, index, controller))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : _noCartLayout(context);
  }

  _productImageLayout(BuildContext context, image) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          width: 100,
          child: Image.asset(image),
        ),
      ),
    );
  }

  _productInfoLayout({context, productTitle, price}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customSpacerHeight(height: 20),
        Text(
          productTitle,
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimensions.fontSizeMid - 3),
        ),
        customSpacerHeight(height: 6),
        Text(
          "\$$price",
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  _productCheckoutLayout(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: marginLayout.copyWith(bottom: 8, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _subTotalTextLayout(context),
            customSpacerHeight(height: 8),
            _deliveryCostLayout(context),
            customSpacerHeight(height: 8),
            dottedSalaryView(height: 342),
            Obx(() => _totalCostLayout(context)),
            customSpacerHeight(height: 22),
            _checkOutButtonLayout(context),
          ],
        ),
      ),
    );
  }

  _productQuantityLayoutView({inAction, price, deAction}) {
    return Card(
      color: AppColor.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: inAction,
              child: const Icon(
                Icons.add,
                color: AppColor.cardColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(
                price.toString(),
                style: AppStyle.normal_text
                    .copyWith(color: Theme.of(context).cardColor),
              ),
            ),
            GestureDetector(
              onTap: deAction,
              child: const Icon(
                Icons.remove,
                color: AppColor.cardColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _noCartLayout(context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SizedBox(
                    height: AppLayout.getHeight(160),
                    child: Lottie.asset(Images.no_data))),
            Text(
              AppString.text_no_cart_add.tr,
              style: AppStyle.normal_text
                  .copyWith(color: Theme.of(context).hintColor),
            )
          ],
        ));
  }

  _subTotalTextLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.text_sub_total.tr,
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).hintColor,
              fontSize: Dimensions.fontSizeMid - 3,
              fontWeight: FontWeight.w200),
        ),
        Obx(
          () => Text(
            "\$ ${Get.find<AddToCartController>().totalPrice.value}",
            style: AppStyle.normal_text_black.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Dimensions.fontSizeMid - 3),
          ),
        )
      ],
    );
  }

  _deliveryCostLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.text_delivery.tr,
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).hintColor,
              fontSize: Dimensions.fontSizeMid - 3),
        ),
        Text(
          "\$60.00",
          style: AppStyle.normal_text_black.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimensions.fontSizeMid - 3),
        ),
      ],
    );
  }

  _totalCostLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.text_total_cost.tr,
          style: AppStyle.normal_text_black
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        Text(
          "\$ ${Get.find<AddToCartController>().totalPrice.value + 60}",
          style: AppStyle.normal_text_black.copyWith(
              color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _checkOutButtonLayout(BuildContext context) {
    return AppButton(
      buttonText: AppString.text_checkout.tr,
      onPressed: () => Get.toNamed(Routes.MY_CART_SCREEN),
      buttonColor: AppColor.primaryColor,
      isButtonExpanded: false,
    );
  }

  _productQuantityLayout(
      BuildContext context, int index, AddToCartController controller) {
    return _productQuantityLayoutView(
        inAction: () {
          controller.addToArray[index].isQuantityIncrement();

          Get.find<AddToCartController>().totalPrice.value =
              Get.find<AddToCartController>().totalPrice.value +
                  controller.addToArray[index].price;
        },
        deAction: () {
          controller.addToArray[index].isQuantityDecrement();
          Get.find<AddToCartController>().totalPrice.value =
              Get.find<AddToCartController>().totalPrice.value -
                  controller.addToArray[index].price;

          if (controller.addToArray[index].quantity.value == 0) {
            controller.removeToCart(
                context: context, productModel: controller.addToArray[index]);
          }
        },
        price: controller.addToArray[index].quantity.value);
  }

  _deletedIconLayout() {
    return const Card(
        color: AppColor.errorColor,
        child: Icon(
          CupertinoIcons.delete,
          color: AppColor.cardColor,
        ));
  }
}

Future navigator({context, index}) {
  var controller = Get.find<AddToCartController>();
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetails(
          title: controller.addToArray[index].title.toString(),
          drc: controller.addToArray[index].description.toString(),
          cetText: controller.addToArray[index].category.toString(),
          price: controller.addToArray[index].price.toString(),
          image: controller.addToArray[index].image,
          index: index,
        ),
      ));
}
