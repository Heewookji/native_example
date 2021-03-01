import 'package:flutter/material.dart';
import 'package:native_example/screen/data_channel_sample.dart';
import 'package:native_example/screen/get_media_display_sample.dart';
import 'package:native_example/screen/get_user_media_sample.dart';
import 'package:native_example/screen/loopback_sample.dart';
import 'package:native_example/src/route_item.dart';

class WebRtcScreen extends StatefulWidget {
  @override
  _WebRtcScreenState createState() => _WebRtcScreenState();
}

class _WebRtcScreenState extends State<WebRtcScreen> {
  List<RouteItem> items;

  @override
  void initState() {
    super.initState();
    _initItems();
  }

  void _initItems() {
    items = <RouteItem>[
      RouteItem(
        title: 'GetUserMedia',
        push: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => GetUserMediaSample()));
        },
      ),
      RouteItem(
        title: 'GetDisplayMedia',
        push: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => GetDisplayMediaSample()));
        },
      ),
      RouteItem(
        title: 'LoopBack Sample',
        push: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoopBackSample()));
        },
      ),
      RouteItem(
        title: 'DataChannel',
        push: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DataChannelSample()));
        },
      ),
    ];
  }

  ListBody _buildRow(context, item) {
    return ListBody(children: <Widget>[
      ListTile(
        title: Text(item.title),
        onTap: () => item.push(context),
        trailing: Icon(Icons.arrow_right),
      ),
      Divider()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter-WebRTC example'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0.0),
        itemCount: items.length,
        itemBuilder: (context, i) {
          return _buildRow(context, items[i]);
        },
      ),
    );
  }
}
