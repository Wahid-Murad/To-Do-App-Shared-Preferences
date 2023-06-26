import 'package:add_to_do/const/custom_button2.dart';
import 'package:add_to_do/controller/date_picker_controller.dart';
import 'package:add_to_do/controller/date_time_controller.dart';
import 'package:add_to_do/controller/time_picker_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';


class CustomSpinnerTimePickerPopUP {
  TimePickerController timePickerController = Get.put(TimePickerController());
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  timePickerPopUP(context, boxText) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            height: height - 430,
            width: width - 59,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberPicker(
                          minValue: 0,
                          maxValue: 23,
                           value: boxText == "Start Time"
                              ? (datePickerController.dateortimepicker.value ==
                                      formatDate(DateTime.now(),
                                          [dd, ".", " ", MM, " ", yyyy])
                                  ? timePickerController.presentHour.value
                                  : timePickerController.hour.value)
                              : timePickerController.endHour.value,
                          // value: boxText == 'Start Time'
                          //     ? timePickerController.hour.value
                          //     : timePickerController.endHour
                          //         .value, //timePickerController.hour.value,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 70,
                          itemHeight: 60,
                          onChanged: (value) {
                             boxText == "Start Time"
                              ? (datePickerController.dateortimepicker.value ==
                                      formatDate(DateTime.now(),
                                          [dd, ".", " ", MM, " ", yyyy])
                                  ? timePickerController.presentHour.value=value
                                  : timePickerController.hour.value=value)
                              : timePickerController.endHour.value=value;
                              print(datePickerController.dateortimepicker.value);
                            // boxText == 'Start Time'
                            //     ? timePickerController.hour.value = value
                            //     : timePickerController.endHour.value = value;
                          },
                          textStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          selectedTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Euclid Regular',
                              fontWeight: FontWeight.bold),
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        NumberPicker(
                          // ignore: unrelated_type_equality_checks
                          minValue: 0,// datePickerController.selectedStartDate.value == datePickerController.dateortimepicker.value ? dateTimeHandler.currentTime.toString() :
                          step: 5,
                          maxValue: 59,
                          value: boxText == "Start Time"
                              ? (datePickerController.dateortimepicker.value ==
                                      formatDate(DateTime.now(),
                                          [dd, ".", " ", MM, " ", yyyy])
                                  ? timePickerController.presentMin.value
                                  : timePickerController.minute.value)
                              : timePickerController.endMinute.value,
                          //value: boxText == 'Start Time'

                              // ? timePickerController.minute.value
                              // : timePickerController.endMinute
                                 // .value, //timePickerController.minute.value,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 35,
                          itemHeight: 60,
                          onChanged: (value) {
                             boxText == "Start Time"
                              ? (datePickerController.dateortimepicker.value ==
                                      formatDate(DateTime.now(),
                                          [dd, ".", " ", MM, " ", yyyy])
                                  ? timePickerController.presentMin.value=value
                                  : timePickerController.minute.value=value)
                              : timePickerController.endMinute.value=value;
                            // boxText == 'Start Time'

                                // ? timePickerController.minute.value = value
                                // : timePickerController.endMinute.value = value;
                          },
                          textStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          selectedTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Euclid Regular',
                              fontWeight: FontWeight.bold),
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black54,
                  height: 0.8,
                  width: width - 40,
                ),
                Row(
                  children: [
                    CustomButton2(width, "Cancel", boxText),
                    Container(
                      width: 0.8,
                      height: 60,
                      color: Colors.black54,
                    ),
                    CustomButton2(width, "Submit", boxText)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
