import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static hideDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }


  static showDialog(String message, Function() onTap) {
    Get.dialog(
      ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Material(
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Montserrat-Medium"
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(
                          onPressed: onTap,
                          child: Text(
                            "Ok",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat-Medium"
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
