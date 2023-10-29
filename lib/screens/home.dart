import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controller/input_controller.dart';
import 'package:e_commerce_app/controller/product_loaded_controller.dart';
import 'package:e_commerce_app/controller/wishList_controller.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/custom_appbar.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/custom_titleText_layout.dart';
import 'package:e_commerce_app/widgets/home_view_widgets.dart';
import 'package:flutter/material.dart';
import '../controller/add_to_cart_controller.dart';
import '../utils/utils.dart';
import 'package:get/get_connect.dart';
import '../widgets/selected_county_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;

  @override
  void initState()  {
    _callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          child: Container(
            margin: margin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _searchFieldLayout(context),
                customSpacerHeight(height: Dimensions.fontSizeDefault),
                _offerLayout(context),
                customSpacerHeight(height: Dimensions.fontSizeDefault - 6),
                tileTextLayout(
                    context: context,
                    text: AppString.text_seleted_category.tr,
                    isHideText: true),
                _categoryLayout(),
                tileTextLayout(
                    context: context,
                    text: AppString.text_popular_items.tr,
                    onAction: () => Get.toNamed(Routes.VIEW_ALL)),
                _popularItemLayout(),
                tileTextLayout(
                    context: context,
                    text: AppString.text_new_arrival.tr,
                    onAction: () => Get.toNamed(Routes.VIEW_ALL)),
                _bannerLayout(),
                customSpacerHeight(height: 26),
                _allItemsLayout(context)
              ],
            ),
          ),
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

  _categoryLayout() {
    return SizedBox(
      height: AppLayout.getHeight(56),
      child: ListView.builder(
        itemCount: categoryIndex.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: _categoryLayoutView(index),
            ),
          );
        },
      ),
    );
  }

  _categoryLayoutView(index) {
    return Card(
        color: currentIndex == index
            ? AppColor.primaryColor
            : Theme.of(context).cardColor,
        elevation: 0,
        shape: roundedRectangleBorder,
        shadowColor: Colors.grey.withOpacity(0.2),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Text(
            categoryIndex[index],
            style: AppStyle.normal_text.copyWith(
                color: currentIndex != index
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).cardColor,
                fontSize: Dimensions.fontSizeDefault),
          ),
        )));
  }

  _popularItemLayout() {
    return SizedBox(
      height: AppLayout.getHeight(230),
      child: FutureBuilder(
        future: ProductLoaded().loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.data}"),
            );
          } else if (snapshot.hasData) {
            var items = snapshot.data as List<ProductModel>;
            return ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 0,
                        shape: roundedRectangleBorder,
                        shadowColor: Colors.grey.withOpacity(0.2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    title: items[index].title.toString(),
                                    drc: items[index].description.toString(),
                                    cetText: items[index].category.toString(),
                                    price: items[index].price.toString(),
                                    image: items[index].image,
                                    index: items[index],
                                    rating:
                                        items[index].rating?.rate.toString(),
                                  ),
                                ));
                          },
                          child: _productViewLayout(
                              image: items[index].image,
                              price: items[index].price.toString(),
                              productName: items[index].title.toString(),
                              placeholder: items[index].image),
                        ),
                      ),
                      Obx(
                        () => _wishListLayout(index, items[index]),
                      ),
                      _addItemLayout(onAction: () {
                        Get.find<AddToCartController>().totalPrice.value =
                            Get.find<AddToCartController>().totalPrice.value +
                                items[index].price;
                        Get.find<AddToCartController>().addToCart(
                            productModel: items[index], context: context);
                      }),
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

  _allItemsLayout(context) {
    return FutureBuilder(
      future: ProductLoaded().loadProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.data ?? ""}"),
          );
        } else if (snapshot.hasData) {
          var items = snapshot.data as List<ProductModel>;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 6,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6),
            itemCount: items.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 0,
                shape: roundedRectangleBorder,
                shadowColor: Colors.grey.withOpacity(0.2),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                title: items[index].title.toString(),
                                drc: items[index].description.toString(),
                                cetText: items[index].category.toString(),
                                price: items[index].price.toString(),
                                image: items[index].image,
                                index: items[index],
                                rating: items[index].rating?.rate.toString(),
                              ),
                            ));
                      },
                      child: _productViewLayout(
                          image: items[index].image,
                          price: items[index].price.toString(),
                          productName: items[index].title.toString(),
                          placeholder: items[index].image),
                    ),
                    Obx(
                      () => _wishListLayout(index, items[index]),
                    ),
                    _addItemLayout(onAction: () {
                      Get.find<AddToCartController>().totalPrice.value =
                          Get.find<AddToCartController>().totalPrice.value +
                              items[index].price;
                      Get.find<AddToCartController>().addToCart(
                          productModel: items[index], context: context);
                    }),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _productImage({image, placeholder}) {
    return Expanded(
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

  _wishListLayout(index, ProductModel items) {
    var controller = Get.find<WishlistController>();
    return Positioned(
      top: 6,
      left: 6,
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

  _addItemLayout({onAction}) {
    return Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: onAction,
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

  _productViewLayout(
      {image, productName, status, required price, placeholder}) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: SizedBox(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18.0, right: 18, top: 18, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productImage(image: image, placeholder: placeholder),
              _productInfo(
                  context: context,
                  status: status,
                  price: price,
                  productName: productName),
            ],
          ),
        ),
      ),
    );
  }

  _bannerLayout() {
    return CarouselSlider.builder(
      itemCount: bannerIndex.length,
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        aspectRatio: 16 / 5, // Occupies the entire screen
        onPageChanged: (index, reason) {},
      ),
      itemBuilder: (context, index, realIndex) {
        return Image.asset(
          bannerIndex[index],
          fit: BoxFit.cover,
        );
      },
    );
  }

  _offerLayout(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: AppColor.primaryColor,
        elevation: 0,
        shape: cardStyle,
        child: Padding(
          padding: marginLayout.copyWith(
              top: AppLayout.getHeight(12), bottom: AppLayout.getHeight(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "A Summer Surprise",
                style: AppStyle.mid_large_text.copyWith(
                    color: Theme.of(context).cardColor,
                    fontSize: Dimensions.fontSizeMid - 5),
              ),
              Text(
                "Cashback 25%",
                style: AppStyle.title_text.copyWith(
                    color: Theme.of(context).cardColor,
                    fontSize: Dimensions.fontSizeMid),
              ),
            ],
          ),
        ),
      ), 
    );
  }

  void _callApi() async{
    Response res = await GetConnect()
        .post("http://10.0.2.2:5001/user/authentication/sign-in", {
      {"email": "a@gmail.com", "password": "12345"}
    });
    print(res.body);
  }
}
