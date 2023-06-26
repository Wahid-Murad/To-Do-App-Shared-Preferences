import 'dart:convert';

import 'package:add_to_do/controller/date_picker_controller.dart';
import 'package:add_to_do/controller/date_time_controller.dart';
import 'package:add_to_do/controller/listview_controller.dart';
import 'package:add_to_do/model/note_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHandler {
  ListviewController listviewController = ListviewController();
  RxString noteId = RxString('');
  var nextId;

  //  saveData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var oldList = await loadData();

  //   if (oldList.isEmpty) {
  //     nextId = '1';
  //     noteId.value = nextId;
  //     //  print(listviewController.noteId.value);
  //   } else {
  //     nextId = (oldList.length + 1).toString();
  //     noteId.value = nextId;
  //     // print('The id is ${listviewController.noteId.value}');
  //   }
  //   var v = Get.find<ListviewController>();
  //   var datePickerController = Get.find<DatePickerController>();
  //   var dateTimeHandler = Get.find<DateTimeHandler>();
  //   final noteData = {
  //     "id": nextId,
  //     "titleText": v.titleController.text,
  //     "noteText": v.noteController.text,
  //     "startDate": datePickerController.dateortimepicker.value,
  //     "endDate": datePickerController.dateortimepicker2.value,
  //     "startTime": dateTimeHandler.startTime.value,
  //     "endTime": dateTimeHandler.endTime.value,
  //   };
  //   print(noteData);
  //   var data = await loadData();
  //   data.add(noteData);
  //   String json = jsonEncode(data);
  //   print('Generated Json $json');
  //   await prefs.setString('NoteData_Key', json);
  // }

  // //Load data
  // loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? json = prefs.getString('NoteData_Key');
  //   print('Loaded Json $json');
  //   if (json == null) {
  //     print("No data in Shared Preferences");
  //     return [];
  //   } else {
  //     // List<Map<String, dynamic>> map = List.from();
  //     var map = jsonDecode(json);
  //     print("map $map");
  //     var v = Get.find<ListviewController>();
  //    v.valueList.value = map.map((e) => Note.fromJson(e)).toList();
  //     return map;
  //   }
  // }

  
  




 // Edit note
editNote(String id, String title, String noteText, String startDate, String endDate, String startTime, String endTime) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   var data = await loadData();
   var noteData = data.firstWhere((element) => element['id'] == id);

  
  if (noteData != null) {
    noteData['titleText'] = title;
    noteData['noteText'] = noteText;
    noteData['startDate'] = startDate;
    noteData['endDate'] = endDate;
    noteData['startTime'] = startTime;
    noteData['endTime'] = endTime;
  
    String json = jsonEncode(data);
    await prefs.setString('NoteData_Key', json);
    return true;
  }
  else{
     return false;
  } 
}
    //var data = await loadData();
  // data.add(noteData);
   //return false;
//    var data = await loadData();
// var noteData;

// try {
//   noteData = data.firstWhere((element) => element['id'] == id);
// } catch (e) {
//   noteData = null;
// }

// if (noteData != null) {
//   noteData['titleText'] = title;
//   noteData['noteText'] = noteText;
//   noteData['startDate'] = startDate;
//   noteData['endDate'] = endDate;
//   noteData['startTime'] = startTime;
//   noteData['endTime'] = endTime;

//   String json = jsonEncode(data);
//   await prefs.setString('NoteData_Key', json);
//   return true;
// } else {
//   return false;
// }




// Load edited data
loadEditedData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? json = prefs.getString('NoteData_Key');

  if (json == null) {
    print("No data in Shared Preferences");
    return;
  } else {
    var map = jsonDecode(json);
    var v = Get.find<ListviewController>();
    v.valueList.value = map.map((e) => Note.fromJson(e)).toList();
  }
}

// // Edit note
// editNote(String id, String title, String noteText, String startDate, String endDate, String startTime, String endTime) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var data = await loadData();

//   int noteIndex = data.indexWhere((element) => element['id'] == id);

//   if (noteIndex != -1) {
//     // Existing note, create a new map and replace the old one
//     Map<String, dynamic> updatedNote = {
//       'id': id,
//       'titleText': title,
//       'noteText': noteText,
//       'startDate': startDate,
//       'endDate': endDate,
//       'startTime': startTime,
//       'endTime': endTime,
//     };
//     data[noteIndex] = updatedNote;
//   } else {
//     // New note, create a map and add it to the list
//     Map<String, dynamic> newNote = {
//       'id': id,
//       'titleText': title,
//       'noteText': noteText,
//       'startDate': startDate,
//       'endDate': endDate,
//       'startTime': startTime,
//       'endTime': endTime,
//     };
//     data.add(newNote);
//   }

//   String json = jsonEncode(data);
//   await prefs.setString('NoteData_Key', json);
// }

// // Load edited data
// loadEditedData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? json = prefs.getString('NoteData_Key');

//   if (json == null) {
//     print("No data in Shared Preferences");
//     return [];
//   } else {
//     List<dynamic> dataList = jsonDecode(json);
//     List<Note> notes = dataList.map((e) => Note.fromJson(e)).toList();
//     return notes;
//   }
// }



// Save data
saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var oldList = await loadData();

  if (oldList.isEmpty) {
    nextId = '1';
    noteId.value = nextId;
  } else {
    nextId = (oldList.length + 1).toString();
    noteId.value = nextId;
  }

  var v = Get.find<ListviewController>();
  var datePickerController = Get.find<DatePickerController>();
  var dateTimeHandler = Get.find<DateTimeHandler>();
  
  final noteData = {
    "id": nextId,
    "titleText": v.titleController.text,
    "noteText": v.noteController.text,
    "startDate": datePickerController.dateortimepicker.value,
    "endDate": datePickerController.dateortimepicker2.value,
    "startTime": dateTimeHandler.startTime.value,
    "endTime": dateTimeHandler.endTime.value,
  };

  var data = await loadData();
  data.add(noteData);
  
  String json = jsonEncode(data);
  await prefs.setString('NoteData_Key', json);
}

// Load data
loadData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? json = prefs.getString('NoteData_Key');
  
  if (json == null) {
    print("No data in Shared Preferences");
    return [];
  } else {
    var map = jsonDecode(json);
  ListviewController v = Get.put(ListviewController());
  //var v = Get.find<ListviewController>();
    v.valueList.value = map.map((e) => Note.fromJson(e)).toList();
      print('The data is ${map}');
    return map;
  }
}


deleteData(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var dataString = await prefs.getString('NoteData_Key');

  if (dataString != null) {
    var data = jsonDecode(dataString);

    // Find the index of the data point with the given ID
    int index = data.indexWhere((element) => element['id'] == id);

    if (index != -1) {
      // Remove the data point from the list
      data.removeAt(index);

      // Update the ID of all the remaining data points
      for (int i = index; i < data.length; i++) {
        data[i]['id'] = (int.parse(data[i]['id']) - 1).toString();
      }

      // Encode the updated data and save it to SharedPreferences
      String updatedDataString = jsonEncode(data);
      await prefs.setString('NoteData_Key', updatedDataString);
    }
  }
}

deleteAfterLoadData(String id) async {
  await deleteData(id);
  loadEditedData();
}


// // Delete data from shared preferences
// deleteData(String id) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var dataString = await prefs.getString('NoteData_Key');

//   if (dataString != null) {
//     var data = jsonDecode(dataString);

//     data.removeWhere((element) => element['id'] == id);

//     String updatedDataString = jsonEncode(data);
//     await prefs.setString('NoteData_Key', updatedDataString);
//   }
// }

// // Delete data and update UI
// deleteAfterLoadData(String id) async {
//   await deleteData(id);
//   loadEditedData();
// }





// Delete data
// deleteData(String id) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var data = await loadData();
  
//   data.removeWhere((element) => element['id'] == id);
  
//   String json = jsonEncode(data);
//   await prefs.setString('NoteData_Key', json);

//   var v = Get.find<ListviewController>();
//   v.valueList.value = data.map((e) => Note.fromJson(e)).toList();
// }

// // Load data after deleting
// loadDataAfterDelete() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? json = prefs.getString('NoteData_Key');
  
//   if (json == null) {
//     print("No data in Shared Preferences");
//     return [];
//   } else {
//     var map = jsonDecode(json);
//     ListviewController v = Get.put(ListviewController());
//     v.valueList.value = map.map((e) => Note.fromJson(e)).toList();
//     print('The data is $map');
//     return map;
//     print(v.valueList.value);
//   }
// }





  removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('NoteData_Key');
  }
}
