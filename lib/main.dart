import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timecard/bridge_js.dart';
import 'package:timecard/clock.dart';
import 'package:timecard/timestamp/cubit/timestamp_cubit.dart';
import 'package:timecard/timestamp/view/timestamp_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'タイムカード（仮）',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'そのうちタイムカードに。'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onClick() {
    retrieve();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '試しに時計を配置',
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: AnalogClock(),
              ),
              BlocProvider(
                  // create: (_) => TimestampCubit(), child: TimestampView()
                  create: (_) => TimestampListCubit()..getAll(),
                  child: TimestampListView())
            ],
          ),
        ));
  }
}
