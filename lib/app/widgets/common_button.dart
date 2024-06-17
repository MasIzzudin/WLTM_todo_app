import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/utils.dart';
import 'common_text.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key,
      this.color,
      required this.onPressed,
      this.label = "",
      this.isImageLabel = false,
      this.imageLabel,
      this.iconLabel,
      this.padding,
      this.margin,
      this.borderRadius,
      this.isLoading = false,
      this.borderColor,
      this.bordered = false,
      this.disable = false,
      this.fontLabelSize = 0,
      this.iconFirst = false,
      this.isIconLabel = false,
      this.labelColor,
      this.minHeight = 0,
      this.paddingIconLabel = 0,
      this.fontWeightLabel,
      this.borderCustom,
    })
      : super(key: key);

  final bool isLoading;
  final void Function()? onPressed;
  final Color? color;
  final Color? labelColor;
  final bool bordered;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String label;
  final bool isImageLabel;
  final Image? imageLabel;
  final Icon? iconLabel;
  final bool isIconLabel;
  final double fontLabelSize;
  final double minHeight;
  final double paddingIconLabel;
  final BorderRadius? borderRadius;
  final bool disable;
  final bool iconFirst;
  final FontWeight? fontWeightLabel;
  final Border? borderCustom;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // highlightColor: Palette.buttonGreen2,
      onTap: isLoading || disable ? null : onPressed,
      child: Container(
        // padding: padding ?? const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0), // bikin loading nya jelek roy
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 10.0),
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: minHeight == 0 ? 50.0 : minHeight,
        ),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          border: borderCustom ?? Border.fromBorderSide(
            BorderSide(
              color: bordered == true ? (borderColor ?? Get.theme.primaryColor) : Colors.transparent,
              width: 1.0)
            ),
          color: disable ? hexToColor("#F4F4F4") : color == Colors.transparent ? Colors.transparent : color ?? Colors.green,
          boxShadow: !bordered && color != Colors.transparent ? [
            BoxShadow(
              color: disable ? hexToColor("#F4F4F4").withOpacity(0.15) : (color?.withOpacity(0.15) ?? Colors.green.withOpacity(0.15)),
              offset: const Offset(0, 10),
              blurRadius: 10,
            )
          ] : []
        ),
        child: isLoading ?
          const SizedBox(
            width: 10.0,
            height: 10.0,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          ) : iconFirst ?
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: paddingIconLabel),
                  child: Visibility(
                    visible: isImageLabel,
                    child: imageLabel ?? Container(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: paddingIconLabel),
                  child: Visibility(
                    visible: isIconLabel,
                    child: iconLabel ?? Container(),
                  ),
                ),
                CommonText(
                  text: label,
                  color: disable == true ? Colors.grey : labelColor ?? Colors.white,
                  size: fontLabelSize == 0 ? 14.0 : fontLabelSize,
                  weight: fontWeightLabel ?? FontWeight.w600,
                ),
              ],
            ) :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: label,
                    color: disable == true ? Colors.grey : labelColor ?? Colors.white,
                    size: fontLabelSize == 0 ? 14.0 : fontLabelSize,
                    weight: fontWeightLabel ?? FontWeight.w600,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: paddingIconLabel),
                    child: Visibility(
                      visible: isImageLabel,
                      child: imageLabel ?? Container(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: paddingIconLabel),
                    child: Visibility(
                      visible: isIconLabel,
                      child: iconLabel ?? Container(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
