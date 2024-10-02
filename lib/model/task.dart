
import 'package:intl/intl.dart';


final formatter = DateFormat.yMd();

class Task {
  String name;
  String description;
  final DateTime date;
  bool isCompleted;

  String get formattedDate {
    return formatter.format(date);
  }

   Task({
    required this.name,
    this.isCompleted=false,
    required this.date,
    required this.description,
  });
}
