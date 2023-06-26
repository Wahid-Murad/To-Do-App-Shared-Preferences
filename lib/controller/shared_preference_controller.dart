import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceController extends GetxController {
  RxList myList = RxList([]);

  // addData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String data = searchController.titleController.text;
  //   String data2 = searchController.noteController.text;
  //   // myList.add(searchController.titleController.text);
  //   // myList.add(searchController.noteController.text);
  //   // print(data);
  //   // print(data2);
  //   await sharedPreferences.setString(
  //       'titleData', searchController.titleController.text);
  //   await sharedPreferences.setString(
  //       'noteData', searchController.noteController.text);
  //   myList.add(searchController.titleController.text);
  //   myList.add(searchController.noteController.text);
  //   print('Data saved to SharedPreferences: $data');
  //   print('Data saved to SharedPreferences: $data2');
  //   //update();
  // }

  // getData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.getString('titleData');
  //   await sharedPreferences.getString('noteData');
  //   // print(await sharedPreferences.getString('titleData'));
  // }
  //   addData() {
  //   //options.add(newData);
  //   // if (newData.toString().trim() != '') {
  //   //   myList.add(newData.toString().trim());
  //   // }
  //   //  myList.add(searchController.titleController.text);
  //   //  myList.add(searchController.noteController.text);
  //   update();
  // }

  // void saveDataToSharedPreferences() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   //sharedPreferences.setStringList('myList', myList.toList());
  //   update();
  //   print("Hi2");
  // }

  // void addToRxList() {
  //   String value = searchController.titleController.text;
  //   myList.add(value);
  //   searchController.titleController.clear();
  //   saveDataToSharedPreferences(); // Save the updated list to SharedPreferences
  //   print("Hi3");
  // }
}
