import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_grid/flutter_responsive_grid.dart';

/// This is an usage example and also POC of what can be done
/// using the display and grid
class MultipleDeviceExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("example"),
      ),
      body: SingleChildScrollView(
        child: FlutterResponsiveRow(
          GridSystemUtils(),
          children: [
            FlutterResponsiveCol(
              Container(
                height: GridSystemUtils.findCurrentHeight(context) / 2,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Text(
                    "Hello!!! current size is: ${GridSystemUtils.findCurrentScreenSize(context)}",
                    textScaleFactor: 3,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              md: 12,
              sm:12,
              lg: 4,
            ),
            FlutterResponsiveCol(
              Hidden.inXsAndSm(
                Container(
                  height: GridSystemUtils.findCurrentHeight(context) / 2,
                  decoration: BoxDecoration(color: Colors.blue.shade900),
                  child: Center(
                    child: Text(
                      "THE IMAGE",
                      textScaleFactor: 3,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              md: 12,
              sm:12,
              lg: 8,
            ),
          ],
        ),
      ),
    );
  }
}
