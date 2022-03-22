import 'package:flutter/material.dart';
import '../cubit/timestamp_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimestampView extends StatelessWidget {
  const TimestampView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(children: [
        BlocBuilder<TimestampCubit, String>(builder: (context, state) {
          return Text(state, style: textTheme.headline1);
        }),
        OutlinedButton(
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
      ]),
    );
  }
}
