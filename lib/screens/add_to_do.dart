import 'package:add_to_do/const/custom_button.dart';
import 'package:add_to_do/const/custom_time_picker.dart';
import 'package:add_to_do/const/datepicker2.dart';
import 'package:add_to_do/controller/date_picker_controller.dart';
import 'package:add_to_do/controller/date_time_controller.dart';
import 'package:add_to_do/controller/listview_controller.dart';
import 'package:add_to_do/controller/shared_preference_controller.dart';
import 'package:add_to_do/controller/sp_handler.dart';
import 'package:add_to_do/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToDo extends StatelessWidget {
  AddToDo({super.key});

  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  ListviewController listviewController = Get.put(ListviewController());
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  SpHandler spHandler = Get.put(SpHandler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        listviewController.noteId.value = '';
                        //Get.back();
                        Get.offAll(HomePage());
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: listviewController.noteId.value != ''
                          ? Text(
                              'Edit ToDo',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            )
                          : Text(
                              'Add ToDo',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Divider(
                  thickness: 2,
                  height: 1,
                  color: Color(0XFFDCDCDC),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                        .copyWith(bottom: 0),
                child: Container(
                  // height: 48,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0XFFD1D5DB)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    focusNode: listviewController.firstTextFieldFocus,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {
           String trimmedValue = value.trim();
           int wordCount = trimmedValue.split(' ').length;
        // Set the trimmed value as the text field value
        if (listviewController.titleController.toString().trim() != '') {
          int wordCount = trimmedValue.split(' ').length;
          // Set the trimmed value as the text field value
          listviewController.titleController.text;
          // Rest of your code...
        }
                      FocusScope.of(context).requestFocus(
                          listviewController.secondTextFieldFocus);
                      // int wordCount = listviewController.titleController.text
                      //     .trim()
                      //     .split(' ')
                      //     .length;
                    // listviewController.titleController.text = trimmedValue;
                    // if(listviewController.titleController.text==''){
                    //   Get.snackbar('Error', 'Edittext error');
                    // }
                    },
                    maxLines: 1,
                    maxLength: listviewController.titleWordLimit,
                    controller: listviewController.titleController,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Write task title',
                      counterText: '',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(
                        12,
                        6,
                        10,
                        12,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),

            
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                        .copyWith(bottom: 0),
                child: Container(
                  // height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0XFFD1D5DB)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    focusNode: listviewController.secondTextFieldFocus,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    onChanged: (text) {
                      listviewController.notewordCount.value = text.length;
                      listviewController.notewordCount;
                    },
                    maxLength: listviewController.noteWordLimit,
                    textInputAction: TextInputAction.newline,
                    controller: listviewController.noteController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Write task note',
                      counterText: '',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(
                        12,
                        6,
                        10,
                        12,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Obx(() => Text(
                      '${listviewController.notewordCount.value}/${listviewController.noteWordLimit}')),
                ),
              ),
              //start date and time
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                        .copyWith(bottom: 0),
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0XFFD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: DatePicker2(
                          isInitialDateTime: true, titleText: 'Start Date'),
                    ),
                    //Start Time
                    SizedBox(
                      width: 10,
                    ),

                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0XFFD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: CustomTimePicker(
                          boxTextString: 'Start Time',
                          timePicker: dateTimeHandler.startTime),
                    ),
                  ],
                ),
              ),

              //end date and time
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                        .copyWith(bottom: 0),
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0XFFD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: DatePicker2(
                          isInitialDateTime: false, titleText: 'End Date'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0XFFD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: CustomTimePicker(
                          boxTextString: 'End Time',
                          timePicker: dateTimeHandler.endTime),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              CustomButton(
                width: 200,
                heiht: 48,
                title: listviewController.noteId.value != '' ? 'Edit' : 'Add',
                onPressed: () async {
                  print(listviewController.noteId.value);
                  SpHandler spHandler = SpHandler();
                  if (listviewController.titleController.toString().trim() == ''||
                      listviewController.noteController.toString().trim() == ''||
                      datePickerController.dateortimepicker.value == "" ||
                      dateTimeHandler.startTime.value == "") {
                    listviewController.titleController;
                    listviewController.noteController;
                    datePickerController.dateortimepicker.value;
                    datePickerController.dateortimepicker2.value;
                    dateTimeHandler.startTime.value;
                    dateTimeHandler.endTime.value;
                    Get.snackbar('Required Data Not Filled Properly',
                        'Plesae Fill all Required fields',
                        colorText: Colors.red,
                        duration: Duration(seconds: 1),
                        snackPosition: SnackPosition.BOTTOM);
                  } else if (listviewController.noteId.value == '') {
                    print('new ${listviewController.noteId.value}');
                    await spHandler.saveData();
                    await spHandler.loadData();
                    listviewController.clearAllData();
                    Get.snackbar('Data added', 'Data add Successfully',
                        colorText: Colors.green,
                        duration: Duration(milliseconds: 500),
                        snackPosition: SnackPosition.BOTTOM);
                    Get.offAll(() => HomePage());
                  } 
                  //  else if(listviewController.noteId.value!=''){
                  //      @override
                  //   onBackPressed() {
                  //     listviewController.noteId.value = '';
                  //   //  return true;
                  //   }
                  // }
                  else if (listviewController.noteId.value != '') {
                    //listviewController.noteId.value='';
                    print('Edit ${listviewController.noteId.value}');
                    await spHandler.editNote(
                        listviewController.noteId.value,
                        listviewController.titleController.text,
                        listviewController.noteController.text,
                        datePickerController.dateortimepicker.value,
                        datePickerController.dateortimepicker2.value,
                        dateTimeHandler.startTime.value,
                        dateTimeHandler.endTime.value);
                    await spHandler.loadEditedData();
                    listviewController.noteId.value = '';
                    datePickerController.selectedStartDate.value;
                    Get.snackbar('Data Updated', 'Data Updated Successfully',
                        colorText: Colors.blue,
                        duration: Duration(milliseconds: 500),
                        snackPosition: SnackPosition.BOTTOM);
                    //Get.to(() => HomePage());
                    Get.offAll(HomePage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
