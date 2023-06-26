
import 'package:get/get.dart';

class DatePickerController extends GetxController {
  RxString startDate = "".obs;
  RxString endDate = "".obs;
  RxString today = "".obs;
  Rx<DateTime> selectedStartDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> selectedEndDate = Rx<DateTime>(DateTime.now());
  var selectedText = "";
  RxString titleText = RxString("");
  RxString dateortimepicker = RxString("");
  RxString dateortimepicker2 = RxString("");
  //var dateortime;
  DateTime? selectedDate;
}
