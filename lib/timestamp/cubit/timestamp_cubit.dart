import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

class TimestampCubit extends Cubit<String> {
  TimestampCubit() : super("00:00");
  void stamp() => emit(DateFormat('HH:mm').format(DateTime.now()));
}
