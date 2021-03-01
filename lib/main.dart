import 'package:flutter/material.dart';
import 'package:flutter_foreground_plugin/flutter_foreground_plugin.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:native_example/screen/battery_screen.dart';
import 'package:native_example/screen/web_rtc_screen.dart';

void main() {
  if (WebRTC.platformIsAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    startForegroundService();
  }
  runApp(MyApp());
}

Future<bool> startForegroundService() async {
  await FlutterForegroundPlugin.setServiceMethodInterval(seconds: 5);
  await FlutterForegroundPlugin.setServiceMethod(globalForegroundService);
  await FlutterForegroundPlugin.startForegroundService(
    holdWakeLock: false,
    onStarted: () {
      print('Foreground on Started');
    },
    onStopped: () {
      print('Foreground on Stopped');
    },
    title: 'Tcamera',
    content: 'Tcamera sharing your screen.',
    iconName: 'ic_stat_mobile_screen_share',
  );
  return true;
}

void globalForegroundService() {
  debugPrint('current datetime is ${DateTime.now()}');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Battery'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => BatteryScreen(),
                ),
              ),
            ),
            RaisedButton(
              child: Text('WebRtc'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => WebRtcScreen(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
