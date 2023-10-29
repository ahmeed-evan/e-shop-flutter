import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/utils/app_string.dart';
import 'package:e_commerce_app/widgets/custom_app_button.dart';
import 'package:e_commerce_app/widgets/custom_snakbar.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../widgets/auth_view_widget.dart';
import '../widgets/custom_spacer.dart';
import '../widgets/home_view_widgets.dart';


class WriteAReview extends StatelessWidget {

  final dynamic title;
  final dynamic image;
  final dynamic drc;
  const WriteAReview(
      {super.key,
        this.title,
        this.image,
        this.drc,
      });
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar(
            context: context,
            text: AppString.text_write_a_review.tr,
            argumentVal: true,
            notAction: () => Get.toNamed(Routes.NOTIFICATION_SCREEN)),
        body: Padding(
          padding: marginLayout,
          child: Column(
            children: [
              _productInfoLayout(context: context,title: title,image: image,dec: drc),
              customSpacerHeight(height: 20),
              AppInputField(title: AppString.text_write_your_review.tr, hint: AppString.text_would_you_like.tr,
              isButtonExpanded: true,
                isFieldElevationHide: true,
              ),
              const Spacer(),
              AppButton(buttonText: AppString.text_submite_reviwe.tr, onPressed: (){
                showToast(context: context,subtext:AppString.text_review_add_succesful.tr ,text: AppString.text_succesful.tr);
                Get.toNamed(Routes.MAIN);
              }, buttonColor: AppColor.primaryColor,isButtonExpanded: false),
              customSpacerHeight(height: 27),


            ],
          ),
        ),
    );
  }

  _productInfoLayout({context,title,dec,image}) {
    return  SizedBox(
      child: Card(
        elevation: 0,
        shape: roundedRectangleBorder,
        shadowColor: Colors.grey.withOpacity(0.2),
        child: Row(
          children: [
            _productImage(context: context,image: image),
            _itemInfoLayout(context: context,title: title,drc: dec),

          ],
        ),
      ),
    );
  }

  _productImage({context,image}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/8,
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

  _itemInfoLayout({context,title,drc}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: AppStyle.normal_text_black.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                overflow: TextOverflow.ellipsis),
          ),
          customSpacerHeight(height: 6),
         _descriptionLayout(context,drc)
        ],
      ),
    );
  }

  _descriptionLayout(BuildContext context,text) {
    return SizedBox(

      width: MediaQuery.of(context).size.width/2,
      child:
        Text("$text",maxLines: 3,style: AppStyle.mid_large_text.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeDefault-1,overflow: TextOverflow.ellipsis),),

    );
  }
}

