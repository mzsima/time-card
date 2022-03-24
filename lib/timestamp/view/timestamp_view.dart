import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../cubit/timestamp_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimestampView extends StatelessWidget {
  const TimestampView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(children: [
        BlocBuilder<TimestampCubit, Map<String, DateTime>>(
            builder: (context, state) {
          textFrom(key) => state.containsKey(key)
              ? DateFormat('HH:mm').format(state[key]!)
              : "--:--";
          var startText = textFrom("start");
          var endText = textFrom("end");

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 120,
                  child: Text(startText,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall)),
              SizedBox(
                  width: 20,
                  child: Text("~",
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall)),
              SizedBox(
                  width: 120,
                  child: Text(endText,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall))
            ],
          );
        }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            child: const Text('Stamp!'),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(),
            ),
            onPressed: () => context.read<TimestampCubit>().stamp(),
          ),
        ),
      ]),
    );
  }
}
