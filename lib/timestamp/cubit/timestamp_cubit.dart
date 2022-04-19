import 'dart:developer';

import 'package:bloc/bloc.dart';

class TimestampCubit extends Cubit<Map<String, DateTime>> {
  TimestampCubit() : super({});

  void stamp() {
    if (state.isEmpty) {
      emit({"start": DateTime.now()});
    } else if (!state.containsKey("end") && state.containsKey("start")) {
      emit({...state, "end": DateTime.now()});
    }
  }
}

class DateTimePair {
  DateTimePair(this.from, this.to);
  final DateTime from;
  final DateTime to;
}

class TimestampListCubit extends Cubit<List<DateTimePair>> {
  TimestampListCubit() : super([]);

  void getAll() {
    var dummy = [
      DateTimePair(DateTime.parse('2022-04-01 10:00'),
          DateTime.parse('2022-04-01 19:00')),
      DateTimePair(DateTime.parse('2022-04-02 10:00'),
          DateTime.parse('2022-04-02 19:00')),
      DateTimePair(DateTime.parse('2022-04-03 10:00'),
          DateTime.parse('2022-04-03 19:00')),
      DateTimePair(DateTime.parse('2022-04-04 10:00'),
          DateTime.parse('2022-04-04 19:00')),
      DateTimePair(DateTime.parse('2022-04-05 10:00'),
          DateTime.parse('2022-04-05 19:00')),
      DateTimePair(DateTime.parse('2022-04-06 10:00'),
          DateTime.parse('2022-04-06 19:00')),
    ];

    log("here");

    emit(dummy);
  }
}
