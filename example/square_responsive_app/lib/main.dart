import 'package:flutter/material.dart';
import 'package:flutter_responsive_grid/flutter_responsive_grid.dart';
import 'package:logging/logging.dart';

void main() {
  configureLogger();
  runApp(MyApp());
}

void configureLogger() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((record) {
    print('[${record.level.name}] ${record.loggerName}'
        '@${record.time} : ${record.message}');
    if (record.error != null) {
      print('Caused by: ${record.error}');
    }
    if (record.stackTrace != null) {
      print('Stacktrace: ${record.stackTrace}');
    }
  });

  //if you want to hide external logs
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    var gridUtils = GridSystemUtils();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: FlutterResponsiveRow(gridUtils, children: <FlutterResponsiveCol>[
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
              ),
              child: Center(
                child: Text(
                  'Current layout is ${GridSystemUtils.findCurrentScreenSize(context)}',
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            xs: 12,
            sm: 6,
          ),
          FlutterResponsiveCol(
            Display(
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    'This will only show in MD or larger',
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
              xs: false,
              md: true,
            ),
          ),
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
              ),
              child: Center(
                child: Text(
                  'xs: 12 | sm: 6',
                ),
              ),
            ),
            xs: 12,
            sm: 6,
          ),
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Center(
                child: Text(
                  'xs: 12 | sm: 6',
                ),
              ),
            ),
            xs: 12,
            sm: 6,
          ),
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'xs: 3 | sm: 1',
                ),
              ),
            ),
            xs: 3,
            sm: 1,
          ),
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  'xs: 6 | sm: 6',
                ),
              ),
            ),
            xs: 6,
            sm: 6,
          ),
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Center(
                child: Text(
                  'Nothing 1...',
                ),
              ),
            ),
          ),
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: Text(
                  'Nothing 2...',
                ),
              ),
            ),
          ),
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  'xs: 12 | sm: 12',
                ),
              ),
            ),
            xs: 12,
            sm: 12,
          ),
          FlutterResponsiveCol(
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text(
                  'Nothing...',
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
