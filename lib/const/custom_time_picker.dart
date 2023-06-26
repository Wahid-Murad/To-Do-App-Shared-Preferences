import 'package:add_to_do/const/custom_time_picker_popup.dart';
import 'package:add_to_do/controller/date_time_controller.dart';
import 'package:add_to_do/controller/time_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomTimePicker extends StatelessWidget {
  CustomTimePicker(
      {Key? key, required this.boxTextString, required this.timePicker})
      : super(key: key);
  var boxTextString;
  RxString timePicker;

  DateTimeHandler timeController = Get.put(DateTimeHandler());
  TimePickerController timePickerPopUp = Get.put(TimePickerController());
  CustomSpinnerTimePickerPopUP customSpinnerTimePickerPopUP =
      Get.put(CustomSpinnerTimePickerPopUP());

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        customSpinnerTimePickerPopUP.timePickerPopUP(
          context,
          boxTextString,
        );
      },
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //labelText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boxText(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  labelText() {
    if (timePicker.value == "") {
      return const SizedBox(
        height: 0,
      );
    } else {
      return SizedBox(
        child: Text(
          boxTextString,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Euclid',
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
  }

  boxText() {
    if (timePicker.value == '') {
      return Text(boxTextString,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
          ));
    } else {
      return Text(
        timePicker.value,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
        ),
      );
    }
  }
}
