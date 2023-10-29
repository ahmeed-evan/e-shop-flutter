import 'package:e_commerce_app/routes/app_pages.dart';
import 'package:e_commerce_app/utils/app_layout.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_color.dart';
import '../utils/dimensions.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: .5,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: _leadingIcon(context),
      leadingWidth: AppLayout.getHeight(70),
      actions: [
        customSpacerWidth(width: 12),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              padding: iconButtonEdgeInsets,
              onPressed: () async {
                Get.toNamed(Routes.NOTIFICATION_SCREEN);
              },
              icon: icon,
            ),
          ],
        ),
      ],
      elevation: .0,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 46);
}

_leadingIcon(BuildContext context) {
  return context.isDarkMode
      ? Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset(Images.dark_logo,
              fit: BoxFit.fitWidth, height: 20.00, width: 20.00),
        )
      : Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Image.asset(Images.logo,
              fit: BoxFit.fitWidth, height: 20.00, width: 20.00),
        );
}

EdgeInsets get leadingEdgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(18), bottom: AppLayout.getHeight(8));
}

EdgeInsets get iconButtonEdgeInsets {
  return EdgeInsets.only(bottom: AppLayout.getHeight(8));
}

Stack get icon {
  return Stack(
    children: [
      GestureDetector(
        onTap: () => Get.toNamed(Routes.NOTIFICATION_SCREEN),
        child: Icon(
          Icons.notifications_none,
          color: AppColor.primaryColor,
          size: Dimensions.fontSizeExtraLarge + 6,
        ),
      ),
      Positioned(right: 3, child: circleIcon)
    ],
  );
}

Icon get circleIcon {
  return Icon(
    Icons.circle,
    color: Colors.red,
    size: AppLayout.getHeight(10),
  );
}
