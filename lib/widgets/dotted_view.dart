import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/app_layout.dart';


Widget dottedSalaryView({required double height}){
  return  DottedBorder(
    borderType: BorderType.Rect, // Set the border type to horizontal
    customPath: (p0) => Path()..lineTo(height, 0),
    color: AppColor.hintColor.withOpacity(0.6),
    dashPattern: const [6, 7],
    strokeWidth: 1.5,
    child: Row(
      children: [
        Divider(
          height: AppLayout.getHeight(18),
          color: AppColor.noColor,
        ),
      ],
    ),
  );
}


