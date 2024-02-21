import 'package:isar/isar.dart';

part 'time_stamps.g.dart';

@embedded
class TimeStamps{
  String? chapter;
  int? timeStampInMilliseconds;

  TimeStamps({
    this.chapter,
    this.timeStampInMilliseconds,
  });
}