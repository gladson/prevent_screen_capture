import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:prevent_screen_capture_example/utils/logger.dart';

import 'package:prevent_screen_capture/prevent_screen_capture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example - Prevent Screen Capture'),
        ),
        body: Center(
          child: Column(
            children: [
              FlatButton(
                color: Colors.redAccent,
                onPressed: () async {
                  try {
                    await PreventScreenCapture.protected();
                  } on PlatformException catch (error, stackTrace) {
                    Logger(message: 'Prevent Screen Capture').error(
                      error: error,
                      stackTrace: stackTrace,
                    );
                  }
                },
                child: Text('off Screen Capture'),
              ),
              FlatButton(
                color: Colors.greenAccent,
                onPressed: () async {
                  try {
                    await PreventScreenCapture.unprotected();
                  } on PlatformException catch (error, stackTrace) {
                    Logger(message: 'Prevent Screen Capture').error(
                      error: error,
                      stackTrace: stackTrace,
                    );
                  }
                },
                child: Text('on Screen Capture'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
