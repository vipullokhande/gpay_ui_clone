import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  int? fontSize;
  Color? fontColor;
  EdgeInsets? padding;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  int? maxLines;
  TextOverflow? overflow;
  TextWidget(
    this.text, {
    super.key,
    this.padding = EdgeInsets.zero,
    this.fontSize = 10,
    this.fontColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Text(
        text,
        maxLines: maxLines!,
        textAlign: textAlign!,
        overflow: overflow!,
        style: TextStyle(
          fontSize: fontSize!.toDouble(),
          color: fontColor!,
          fontWeight: fontWeight!,
        ),
      ),
    );
  }
}
