import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../utils/app_layout.dart';
import '../utils/app_string.dart';
import '../utils/utils.dart';
import 'package:e_commerce_app/utils/app_color.dart';
import 'package:e_commerce_app/widgets/auth_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _paymentMethodAppbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Opacity(
                          opacity: currentIndex == index ? 0.9 : 0.5,
                          child: Image.asset(
                            list[index],
                          )),
                    ),
                    _checkBoxLayout(context, index),
                  ],
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: _addPaymentCard(context),
    );
  }

  _paymentMethodAppbar(context) {
    return appBar(
      context: context,
      text: AppString.text_payment_method.tr,
      argumentVal: true,
      isNotificationHide: true,
    );
  }

  _checkBoxLayout(BuildContext context, index) {
    return Padding(
      padding: marginLayout.copyWith(left: AppLayout.getWidth(24)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: currentIndex == index
                ? Icon(Icons.check_box, color: AppColor.primaryColor)
                : Icon(Icons.check_box_outline_blank,
                    color: Theme.of(context).colorScheme.onPrimary),
          ),
          customSpacerWidth(width: 12),
          Text(AppString.text_use_a_defualt_payment_method.tr)
        ],
      ),
    );
  }

  _addPaymentCard(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(Routes.ADD_PAYMENT_METHOD),
      backgroundColor: Theme.of(context).cardColor,
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
