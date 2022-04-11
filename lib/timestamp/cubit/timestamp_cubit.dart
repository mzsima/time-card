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

class TimestampListCubit extends Cubit<List<DateTime>> {
  TimestampListCubit() : super([]);
  void stamp() {
    emit([...state, DateTime.now()]);
  }
}
