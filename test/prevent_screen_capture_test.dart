// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:prevent_screen_capture/prevent_screen_capture.dart';

// void main() {
//   const MethodChannel channel = MethodChannel('prevent_screen_capture');

//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {
//     channel.setMockMethodCallHandler((MethodCall methodCall) async {
//       return '42';
//     });
//   });

//   tearDown(() {
//     channel.setMockMethodCallHandler(null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await PreventScreenCapture.platformVersion, '42');
//   });
// }
