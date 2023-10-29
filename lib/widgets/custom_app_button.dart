import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:e_commerce_app/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class AppButton extends StatelessWidget {
  final bool? hasOutline;
  final String buttonText;
  final Function onPressed;
  final Color buttonColor;
  final Color? textColor;
  final bool? isButtonExpanded;
  final bool? isTextButton;
  final IconData? iconsData;

  const AppButton({
    super.key,
    this.hasOutline = false,
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    this.textColor = Colors.white,
    this.isButtonExpanded = true,
    this.isTextButton = false,
    this.iconsData,
  });

  @override
  Widget build(BuildContext context) {
    return isTextButton != true
        ? isButtonExpanded == true
            ? Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton.icon(
                    icon: iconsData == null
                        ? Container()
                        : Icon(iconsData, size: 20, color: textColor),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusMid - 3)),
                        side: BorderSide(width: 1, color: buttonColor)),
                    onPressed: () async {
                      onPressed();
                    },
                    label: Text(
                      buttonText,
                      overflow: TextOverflow.ellipsis,
                      style: textColor != null
                          ? AppStyle.normal_text.copyWith(
                              color: textColor,
                              fontWeight: hasOutline == false
                                  ? FontWeight.w600
                                  : FontWeight.w400)
                          : AppStyle.normal_text.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                    ),
                  ),
                ),
              )
            : SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton.icon(
                  icon: iconsData == null
                      ? Container()
                      : Icon(iconsData, color: textColor),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusMid - 3)),
                      side: BorderSide(width: 1, color: buttonColor)),
                  onPressed: () async {
                    onPressed();
                  },
                  label: Text(
                    buttonText,
                    style: textColor != null
                        ? AppStyle.normal_text.copyWith(
                            color: textColor,
                            fontWeight: hasOutline == false
                                ? FontWeight.w600
                                : FontWeight.w400)
                        : AppStyle.normal_text.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                ),
              )
        : SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton.icon(
              icon: iconsData == null
                  ? Container()
                  : Icon(iconsData, size: 20, color: textColor),
              style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusMid - 3)),
                  side: BorderSide(width: 0, color: buttonColor)),
              onPressed: () async {
                onPressed();
              },
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.google),
                  customSpacerWidth(width: 12),
                  Text(
                    buttonText,
                    style: textColor != null
                        ? AppStyle.normal_text.copyWith(
                            color: textColor,
                            fontWeight: hasOutline == false
                                ? FontWeight.w600
                                : FontWeight.w400)
                        : AppStyle.normal_text.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                ],
              ),
            ),
          );
  }
}
