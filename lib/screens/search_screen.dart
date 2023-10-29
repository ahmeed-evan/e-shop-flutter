import 'package:e_commerce_app/controller/input_controller.dart';
import 'package:e_commerce_app/screens/product_details.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/product_loaded_controller.dart';
import '../models/product_model.dart';
import '../utils/dimensions.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? search;
  var controller=Get.find<InputController>().searchController;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context: context, text: AppString.text_search.tr, argumentVal: true,
      widget: _cancel()),
      body: Padding(
        padding: marginLayout,
        child: Column(
          children: [
            customSpacerHeight(height: 16),
            _searchFieldLayout(),
            customSpacerHeight(height: 8),
            _searchResultListLayout(),
          ],
        ),
      ),
    );
  }


  _searchResultListLayout() {
    var controller=Get.find<InputController>().searchController.text;
    return  Expanded(
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
                itemBuilder: (context, index) {
                  late String position = items[index].title.toString();
                  if (controller.isEmpty) {
                    return GestureDetector(
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
                      child: _listViewLayout(index:items[index],color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),iconColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)),
                    );
                  } else if (position
                      .toLowerCase()
                      .contains(controller.toLowerCase())) {
                    return GestureDetector(
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
                      child: _listViewLayout(index:items[index],color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),iconColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)),
                    );
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  _searchFieldLayout() {
    return   Card(
      shape: _cardStyle,
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: AppColor.backgroundColor,
                  prefixIcon:   Icon(CupertinoIcons.search,color: AppColor.hintColor.withOpacity(0.8),),
                  hintText: AppString.text_enter_search.tr,
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault),
                      borderSide:  BorderSide.none)),
              onChanged: (String? value) {
                setState(() {
                  search = value.toString();
                });
              },
            ),
          ),

          Container(width: AppLayout.getWidth(2),height:AppLayout.getHeight(20),color: Theme.of(context).hintColor.withOpacity(0.5),),
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.mic,color: Theme.of(context).hintColor,size: Dimensions.fontSizeLarge+7,)),
        ],
      ),
    );
  }

  _listViewLayout({index,Color?color,Color?iconColor}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
           Icon(CupertinoIcons.time,size: Dimensions.fontSizeLarge+4,color: iconColor,),customSpacerWidth(width: 12),
          Text(index.title.toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: Dimensions.fontSizeDefault,color: color)),

        ],
      ),
    );
  }

  _cancel() {
    return GestureDetector(
        onTap: ()=>Get.back(),
        child: Text(AppString.text_cancel.tr,style: AppStyle.normal_text_black.copyWith(color: AppColor.primaryColor),));
  }

}

RoundedRectangleBorder get _cardStyle {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusMid));
}