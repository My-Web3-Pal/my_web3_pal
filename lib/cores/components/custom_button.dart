// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../cores/constants/color.dart';
import '../constants/font_size.dart';
import '../utils/sizer_utils.dart';
import 'custom_text_widget.dart';
import 'loading_indicator.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight = FontWeight.w700,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        iconData = null,
        borderColor = null,
        iconSize = null,
        iconColor = null;

  const Button.withBorderLine({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = Colors.transparent,
    this.borderColor = kcPrimaryColor,
    this.textColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight = FontWeight.w700,
    this.circular = false,
    this.active = true,
    this.iconData,
    this.iconColor,
  })  : busy = false,
        iconSize = null;

  const Button.loading({
    Key? key,
    this.onTap,
    this.color,
    this.height,
    this.width,
  })  : busy = true,
        iconData = null,
        text = null,
        textColor = null,
        textSize = kfsMedium,
        textFontWeight = null,
        iconSize = null,
        iconColor = null,
        borderColor = null,
        active = true,
        circular = false;

  const Button.smallSized({
    Key? key,
    this.text,
    this.onTap,
    this.color,
    this.textColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        borderColor = null,
        iconColor = null;

  const Button.icon({
    Key? key,
    this.text,
    this.iconData = Icons.arrow_forward,
    this.height,
    this.width,
    this.onTap,
    this.color,
    this.iconColor,
    this.iconSize,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        borderColor = null,
        textColor = null,
        textSize = kfsMedium,
        textFontWeight = null;

  final String? text;
  final IconData? iconData;
  final void Function()? onTap;
  final bool busy;
  final bool active;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? textSize;
  final double? height;
  final double? width;
  final FontWeight? textFontWeight;
  final Color? iconColor;
  final double? iconSize;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    const double defaultHeight = 45.0;
    final double defaultWidth = MediaQuery.of(context).size.width * 0.95;

    return SizedBox(
      height: sp(height ?? defaultHeight),
      width: sp(width ?? defaultWidth),
      child: TextButton(
        key: key,
        onPressed: () {
          if (active == false) return;

          onTap!();
        },
        style: getButtonStyle(),
        child: getButtonChild(),
      ),
    );
  }

  ButtonStyle getButtonStyle() {
    MaterialStateProperty<RoundedRectangleBorder> shape;

    if (circular) {
      shape = MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sp(100.0)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      );
    } else {
      shape = MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sp(10.0)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      );
    }

    MaterialStateProperty<Color> backgroundColor;
    if (busy) {
      backgroundColor = MaterialStateProperty.all(kcPrimaryColor);
    } else if (active == false) {
      backgroundColor = MaterialStateProperty.all(kcGrey400);
    } else {
      backgroundColor = MaterialStateProperty.all(color ?? kcPrimaryColor);
    }

    return ButtonStyle(
      shape: shape,
      backgroundColor: backgroundColor,
    );
  }

  Widget getButtonChild() {
    if (text == null) {
      if (busy) {
        return SizedBox(
          height: sp(21),
          width: sp(21),
          child: const LoadingIndicatorWidget(),
        );
      } else {
        return Icon(
          iconData,
          color: iconColor ?? Colors.white,
          size: iconSize ?? 20.0,
        );
      }
    } else {
      if (iconData != null) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (text != null)
              TextWidget(
                text ?? 'no text',
                textColor: textColor ?? Colors.white,
                fontSize: sp(15),
                fontWeight: textFontWeight,
              ),
            if (text != null) horizontalSpace(),
            Icon(
              iconData,
              color: iconColor ?? Colors.white,
              size: iconSize ?? 20.0,
            ),
          ],
        );
      }

      return TextWidget(
        text ?? 'no text',
        textColor: textColor ?? Colors.white,
        fontSize: sp(15),
        fontWeight: textFontWeight,
      );
    }
  }
}
