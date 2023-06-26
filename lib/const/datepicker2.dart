import 'package:add_to_do/controller/date_picker_controller.dart';
import 'package:add_to_do/controller/listview_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePicker2 extends StatelessWidget {
  DatePicker2({
    Key? key,
    required this.isInitialDateTime,
    required this.titleText,
  }) : super(key: key);
  final bool isInitialDateTime;
  final String titleText;

  DatePickerController datePickerController = Get.put(DatePickerController());
  ListviewController listviewController = Get.put(ListviewController());

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        //start date
        if (isInitialDateTime == true) {
          DateTime? pickStartDate = await showDatePicker(
              context: context,
              initialDate:  datePickerController.selectedStartDate.value,//listviewController.noteId.value!='' ? : datePickerController.selectedDate2.value
              firstDate: DateTime.now(), //DateTime(2000),
              lastDate: DateTime(2101));
          if (pickStartDate != null) {
            datePickerController.selectedDate = pickStartDate;
            datePickerController.selectedStartDate.value = pickStartDate;
            datePickerController.dateortimepicker.value =
                formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
            // if (pickStartDate == DateTime.now()) {
            //   datePickerController.today.value =
            //       datePickerController.dateortimepicker.value;
            //   print(datePickerController.today);
            // }
          }
        }
        //end
        if (datePickerController.dateortimepicker.isEmpty) {
          Get.snackbar(
              'StartDate Not Selected', 'Firstly Select The Start Date',
              // titleText: Text(
              //   "Not Selected",
              //   style: TextStyle(color: Colors.red),
              // ),
              // messageText: Text(
              //   "Firstly Select The Start Date",
              //   style: TextStyle(color: Colors.redAccent),
              // ),
              colorText: Colors.red,
              duration: Duration(seconds: 1),
              // backgroundColor: Colors.black54,
              snackPosition: SnackPosition.BOTTOM);
        } else if (isInitialDateTime == false) {
          DateTime? pickEndDate = await showDatePicker(
              context: context,
              initialDate: datePickerController.selectedStartDate.value
                      .isAfter(datePickerController.selectedEndDate.value)
                  ? datePickerController.selectedStartDate.value
                  : datePickerController.selectedEndDate.value,
              firstDate: datePickerController.selectedStartDate.value,
              lastDate: DateTime(2101));

          // if (pickEndDate!.isAfter(datePickerController.selectedStartDate.value)) {
          //   datePickerController.selectedEndDate.value = pickEndDate;
          // }
          datePickerController.dateortimepicker2.value =
              formatDate(pickEndDate!, [dd, ".", " ", MM, " ", yyyy]);
        } else if (datePickerController.selectedStartDate.value
            .isAfter(datePickerController.selectedEndDate.value)) {
          datePickerController.dateortimepicker2.value = '';
        // } else if (datePickerController.selectedEndDate.value
        //     .isAfter(datePickerController.selectedStartDate.value)) {
        //   print("End date is greater than start date");
        } else if (datePickerController.selectedEndDate.value
            .isAtSameMomentAs(datePickerController.selectedStartDate.value)) {
               datePickerController.dateortimepicker2.value;
          print("Same Date");
        }
      },
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleText2(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedText2(),
                ],
              ),
            ],
          )),
    );
  }

  titleText2() {
    if (datePickerController.selectedText == "") {
      return const SizedBox(height: 0);
    } else {
      //widget.boxTextString = widget.dateortimepicker;
      return SizedBox(
        height: 14,
        child: Center(
          child: Text(titleText,
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Euclid',
                  color: Colors.grey,
                  fontWeight: FontWeight.w500)),
        ),
      );
    }
  }

  selectedText2() {
    if (datePickerController.dateortimepicker == "" &&
        isInitialDateTime == true) {
      return Center(
        child: Text(
          titleText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
          ),
        ),
      );
    } else if (isInitialDateTime == true) {
      return Center(
        child: Text(
          datePickerController.dateortimepicker.value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ),
        ),
      );
    }

    if (datePickerController.dateortimepicker2 == "" &&
        isInitialDateTime == false) {
      return Center(
        child: Text(
          titleText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ),
        ),
      );
    }
    //  else if (datePickerController.dateortimepicker == "") {
    //   return Center(
    //     child: Text(
    //       titleText,
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontFamily: 'Euclid Regular',
    //         color: Colors.black,
    //         //fontWeight: FontWeight.w500
    //       ),
    //     ),
    //   );
    // }
    else if (isInitialDateTime == false) {
      return Text(
        datePickerController.dateortimepicker2.value,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
        ),
      );
    }
  }
}
