import 'package:add_to_do/const/custom_button.dart';
import 'package:add_to_do/const/note_data_format.dart';
import 'package:add_to_do/controller/date_picker_controller.dart';
import 'package:add_to_do/controller/date_time_controller.dart';
import 'package:add_to_do/controller/listview_controller.dart';
import 'package:add_to_do/controller/shared_preference_controller.dart';
import 'package:add_to_do/screens/add_to_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  ListviewController listviewController = Get.put(ListviewController());
  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => Column(
                  children: [
                    listviewController.valueList.isEmpty
                        ? SizedBox(
                          height: MediaQuery.of(context).size.height-34,
                          child: Center(
                             child: CustomButton(
                                width: 120,
                                heiht: 45,
                                title: 'Add ToDo',
                                onPressed: () {
                                  listviewController.noteId.value='';
                                  //print(listviewController.noteId.value='');
                                  listviewController.notewordCount.value = 0;
                                   listviewController.clearAllData();
                                  Get.offAll(() => AddToDo());
                                },
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                        CustomButton(
                          width: 120,
                          heiht: 45,
                          title: 'Add ToDo',
                          onPressed: () {
                            listviewController.notewordCount.value = 0;
                              listviewController.clearAllData();
                            Get.to(() => AddToDo());
                          },
                        ),
                      ],
                    ),
                  ),
            NoteDateFormat(),
          ],
        ),
      ),
      ),
    );
  }
}
