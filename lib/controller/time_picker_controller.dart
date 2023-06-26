import 'dart:math';

import 'package:add_to_do/controller/date_picker_controller.dart';
import 'package:add_to_do/controller/date_time_controller.dart';
import 'package:add_to_do/controller/listview_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TimePickerController extends GetxController {
  var hour = 0.obs;
  var minute = 0.obs;
  var endHour = 0.obs;
  var endMinute = 0.obs;
  RxString startTime = "".obs;
  RxString endTime = "".obs;
  var selectedText = "";
  RxString titleText = RxString("");
  var presentHour=DateTime.now().hour.obs;
  var presentMin=DateTime.now().minute.obs;

  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  DatePickerController datePickerController = Get.put(DatePickerController());
  ListviewController listviewController = Get.put(ListviewController());

     setStartHourMin() {
    // dateTimeHandler.startTime.value =
    //     "${hour.value.toString().padLeft(2, '0')}:${minute.value.toString().padLeft(2, '0')}";
    // dateTimeHandler.addDateTime(dateTimeHandler.startTime);
    // Get.back();

    if (datePickerController.dateortimepicker.value ==
        formatDate(DateTime.now(), [dd, ".", " ", MM, " ", yyyy])) {
      var initialTime = DateTime.now().hour + (DateTime.now().minute / 60);
      var selecetedTime = presentHour.value + (presentMin.value / 60);
      print(presentHour);
      if (selecetedTime - initialTime < 0) {
        dateTimeHandler.startTime.value = '';
            print(presentHour);
        return Get.snackbar('Incorrect Time',
                        'Please Select a valid Time',
                        colorText: Colors.red,
                        snackPosition: SnackPosition.BOTTOM);
                    

         } else {
        dateTimeHandler.startTime.value =
            "${presentHour.value.toString().padLeft(2, '0')}:${presentMin.value.toString().padLeft(2, '0')}";
           // print(presentHour);
      }
    } else {
      dateTimeHandler.startTime.value =
          "${hour.value.toString().padLeft(2, '0')}:${minute.value.toString().padLeft(2, '0')}";
          //print(presentHour);
    }
  
    //dateTimeHandler.startTime.value = dateTimeHandler.startTime.value;
    Get.back();
  }




  void setEndHourMin() {
    dateTimeHandler.endTime.value =
        "${endHour.value.toString().padLeft(2, '0')}:${endMinute.value.toString().padLeft(2, '0')}";
    dateTimeHandler.addDateTime(dateTimeHandler.endTime);
    Get.back();
  }

  void timeValidation() {
    var et = endHour.value + (endMinute.value / 60);
    var st = hour.value + (minute.value / 60);
    if (datePickerController.dateortimepicker ==
            datePickerController.dateortimepicker2 &&
        (et - st) < 0) {
      dateTimeHandler.endTime.value = '';
      Get.snackbar('Required Data Not Filled Properly',
          'Plesae Fill all Required fields',
          // titleText: Text(
          //   "Not Selected",
          //   style: TextStyle(color: Colors.red),
          // ),
          // messageText: Text(
          //   "Firstly Select The Start Date",
          //   style: TextStyle(color: Colors.redAccent),
          // ),
          colorText: Colors.red,
          // backgroundColor: Colors.black54,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      setEndHourMin();
    }
  }
}
