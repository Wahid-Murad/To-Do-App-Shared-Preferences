import 'package:add_to_do/controller/date_picker_controller.dart';
import 'package:add_to_do/controller/date_time_controller.dart';
import 'package:add_to_do/controller/listview_controller.dart';
import 'package:add_to_do/controller/sp_handler.dart';
import 'package:add_to_do/screens/add_to_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class NoteDateFormat extends StatelessWidget {
  NoteDateFormat({super.key});
  ListviewController listviewController = Get.put(ListviewController());
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  SpHandler spHandler = Get.put(SpHandler());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: ListView.builder(
            itemCount: listviewController.valueList.length,
            itemBuilder: (context, index) {
              //If startdate and enddate are same or enddate are empty and entime is empty
              if (listviewController.valueList[index].startDate ==
                      listviewController.valueList[index].endDate ||
                  listviewController.valueList[index].endDate == "" &&
                      listviewController.valueList[index].endTime == "") {
                return InkWell(
                  onTap: () {
                    listviewController.noteId.value =
                        listviewController.valueList[index].id;
                    listviewController.titleController.text =
                        listviewController.valueList[index].titleText;
                    listviewController.noteController.text =
                        listviewController.valueList[index].noteText;
                    datePickerController.dateortimepicker.value =
                        listviewController.valueList[index].startDate;
                    datePickerController.dateortimepicker2.value =
                        listviewController.valueList[index].endDate;
                    dateTimeHandler.startTime.value =
                        listviewController.valueList[index].startTime;
                    dateTimeHandler.endTime.value =
                        listviewController.valueList[index].endTime;
                    listviewController.notewordCount.value;
                    Get.to(AddToDo());
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5)
                            .copyWith(top: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0XFFDCDCDC)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, bottom: 16),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${listviewController.valueList[index].titleText}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF212121)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${listviewController.valueList[index].noteText}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF8A8A8A),
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Add this line to handle overflow
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await spHandler.deleteAfterLoadData(
                                        listviewController.valueList[index].id);
                                    Get.snackbar(
                                      'Data Deleted',
                                      'Data Deleted Successfully',
                                      colorText: Colors.red,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                  iconSize: 20,
                                  color: Color(0XFFFF4949),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              //If enddate are empty but entime is Notempty
              else if (listviewController.valueList[index].endDate == "") {
                return InkWell(
                  onTap: () {
                    listviewController.noteId.value =
                        listviewController.valueList[index].id;
                    listviewController.titleController.text =
                        listviewController.valueList[index].titleText;
                    listviewController.noteController.text =
                        listviewController.valueList[index].noteText;
                    datePickerController.dateortimepicker.value =
                        listviewController.valueList[index].startDate;
                    datePickerController.dateortimepicker2.value =
                        listviewController.valueList[index].endDate;
                    dateTimeHandler.startTime.value =
                        listviewController.valueList[index].startTime;
                    dateTimeHandler.endTime.value =
                        listviewController.valueList[index].endTime;
                    Get.to(AddToDo());
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5)
                            .copyWith(top: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0XFFDCDCDC)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, bottom: 16),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${listviewController.valueList[index].titleText}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF212121)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${listviewController.valueList[index].noteText}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF8A8A8A),
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Add this line to handle overflow
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await spHandler.deleteAfterLoadData(
                                        listviewController.valueList[index].id);
                                    Get.snackbar(
                                      'Data Deleted',
                                      'Data Deleted Successfully',
                                      colorText: Colors.red,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                  iconSize: 20,
                                  color: Color(0XFFFF4949),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime} - ${listviewController.valueList[index].endTime}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              //If enddate is Notempty but entime is empty
              else if (listviewController.valueList[index].endTime == "") {
                return InkWell(
                  onTap: () {
                    listviewController.noteId.value =
                        listviewController.valueList[index].id;
                    listviewController.titleController.text =
                        listviewController.valueList[index].titleText;
                    listviewController.noteController.text =
                        listviewController.valueList[index].noteText;
                    datePickerController.dateortimepicker.value =
                        listviewController.valueList[index].startDate;
                    datePickerController.dateortimepicker2.value =
                        listviewController.valueList[index].endDate;
                    dateTimeHandler.startTime.value =
                        listviewController.valueList[index].startTime;
                    dateTimeHandler.endTime.value =
                        listviewController.valueList[index].endTime;
                    Get.to(AddToDo());
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5)
                            .copyWith(top: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0XFFDCDCDC)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, bottom: 16),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${listviewController.valueList[index].titleText}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF212121)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${listviewController.valueList[index].noteText}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF8A8A8A),
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Add this line to handle overflow
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await spHandler.deleteAfterLoadData(
                                        listviewController.valueList[index].id);
                                    Get.snackbar(
                                      'Data Deleted',
                                      'Data Deleted Successfully',
                                      colorText: Colors.red,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                  iconSize: 20,
                                  color: Color(0XFFFF4949),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime} - ${listviewController.valueList[index].endDate}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              //if endDate is not empty and endtime is notEmpty
              else {
                return InkWell(
                  onTap: () {
                    listviewController.noteId.value =
                        listviewController.valueList[index].id;
                    listviewController.titleController.text =
                        listviewController.valueList[index].titleText;
                    listviewController.noteController.text =
                        listviewController.valueList[index].noteText;
                    datePickerController.dateortimepicker.value =
                        listviewController.valueList[index].startDate;
                    datePickerController.dateortimepicker2.value =
                        listviewController.valueList[index].endDate;
                    dateTimeHandler.startTime.value =
                        listviewController.valueList[index].startTime;
                    dateTimeHandler.endTime.value =
                        listviewController.valueList[index].endTime;
                    Get.to(AddToDo());
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5)
                            .copyWith(top: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0XFFDCDCDC)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, bottom: 16),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${listviewController.valueList[index].titleText}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF212121)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${listviewController.valueList[index].noteText}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF8A8A8A),
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Add this line to handle overflow
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await spHandler.deleteAfterLoadData(
                                        listviewController.valueList[index].id);
                                    Get.snackbar(
                                      'Data Deleted',
                                      'Data Deleted Successfully',
                                      colorText: Colors.red,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                  iconSize: 20,
                                  color: Color(0XFFFF4949),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime} - ${listviewController.valueList[index].endDate} at ${listviewController.valueList[index].endTime}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
