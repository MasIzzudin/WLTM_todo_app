import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wltm_test/app/widgets/widgets.dart';

class Snackbar {
  static warning(String message, {
    Color? mainColor, 
    Color? textColor, 
    double? textSize,
    Duration? duration, 
    Widget? preffixWidget,
    ShapeBorder? shape,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        width: Get.width/1.2,
        elevation: 0,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)
        ),
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
        content: ConditionalWidget(
          condition: preffixWidget != null, 
          builder: (ctx) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              preffixWidget!,
              const SizedBox(width: 20,),
              Text(
                message,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )
            ],
          ),
          fallback: (ctx) => Text(
            message,
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        duration: duration ?? const Duration(seconds: 3),
        backgroundColor: mainColor ?? Colors.yellow,
      ),
    );
  }

  static success(String message, {
    Color? mainColor, 
    Color? textColor, 
    double? textSize,
    Duration? duration, 
    Widget? preffixWidget,
    ShapeBorder? shape,
    Widget? suffixWidget
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)
        ),
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            ConditionalWidget(
              condition: preffixWidget != null, 
              builder: (ctx) => preffixWidget!,
              fallback: (context) => Container(),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: textSize ?? 14,
                ),
              ),
            ),
            const SizedBox(width: 8,),
            ConditionalWidget(
              condition: suffixWidget != null, 
              builder: (ctx) => suffixWidget!,
              fallback: (context) => Container(),
            ),
          ],
        ),
        duration: duration ?? const Duration(seconds: 3),
        backgroundColor: mainColor ?? Colors.green,
      ),
    );
  }

  static info(
    String message, {
    TextButton? mainButton,
    bool? showProgressIndicator,
    bool? isDismissible,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)
        ),
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            const Icon(Icons.info, color: Colors.white),
            const SizedBox(width: 20,),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.blue,
      ),
    );
  }
}


/* 

  style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(24.0),
              side: BorderSide(
                  color: bordered == true
                      ? (borderColor ?? Get.theme.primaryColor)
                      : Colors.transparent,
                  width: 1.0)),
              disabledColor: Colors.white,
              disabledTextColor: const Color(0xFF5D6D89),
              color: bordered == true ? Colors.transparent : color ?? primary,
              elevation: 0.0,
              focusElevation: 0.0,
              hoverElevation: 0.0,
              disabledElevation: 0.0,
              highlightElevation: 0.0,
          ),


 */
