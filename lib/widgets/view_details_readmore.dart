import 'package:e_commerce_app/utils/app_style.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String firstHalf;
  late String secondHalf;
  bool isExpanded = false;

  @override
  void initState() {
    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(101, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf == ""
        ? RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.text,
            style: _disTextStyle(context),
          ),
        ],
      ),
    )
        : RichText(
      text: TextSpan(
        children: [
          // half text layout here
          _halfText(),
          TextSpan(
            text: isExpanded ? " Read less" : " ... Read more",
            style: AppStyle.normal_text_black.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  isExpanded = !isExpanded;
                });

                //_readMoreText();
              },
          ),
        ],
      ),
    );
  }

  _halfText() {
    return  TextSpan(
      text: isExpanded ? widget.text : firstHalf,
      style: _disTextStyle(context),
    );
  }
}

TextStyle  _disTextStyle(context) {
  return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.fontSizeDefault+1);
}