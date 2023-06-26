class Note {
  String? id;
  String? titleText;
  String? noteText;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;

  Note({
    required this.id,
    required this.titleText,
    required this.noteText,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': titleText,
      'note': noteText,
      'startDate': startDate,
      'endDate': endDate,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] ?? '',
      titleText: json['titleText'] ?? '',
      noteText: json['noteText'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
    );
  }
}
