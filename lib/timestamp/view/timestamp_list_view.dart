import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../cubit/timestamp_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimestampListView extends StatelessWidget {
  const TimestampListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
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
            onPressed: () => context.read<TimestampListCubit>().stamp(),
          ),
        ),
        BlocBuilder<TimestampListCubit, List<DateTime>>(
            builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.length,
            itemBuilder: (context, index) {
              final item = state[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(DateFormat('HH:mm').format(item),
                      textAlign: TextAlign.center),
                ),
              );
            },
          );
        }),
      ]),
    );
  }
}
