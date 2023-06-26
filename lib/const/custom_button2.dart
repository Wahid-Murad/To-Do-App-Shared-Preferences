import 'package:add_to_do/controller/time_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget CustomButton2(width, buttonText, startorEnd) {
  TimePickerController timePickerController = Get.put(TimePickerController());
  return TextButton(
    style: TextButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      //backgroundColor: Colors.red,
      shape: buttonText == "Cancel"
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
              ),
            )
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
              ),
            ),
    ),
    onPressed: () {
      buttonText == "Cancel"
          ? Get.back()
          : startorEnd == "Start Time"
              ? timePickerController.setStartHourMin()
              : timePickerController.timeValidation();
    },
    child: buttonText == "Cancel"
        ? SizedBox(
            height: 30,
            width: (width - 60) / 2,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.red),
              ),
            ),
          )
        : SizedBox(
            height: 30,
            width: (width - 60) / 2,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
            ),
          ),
  );
}
