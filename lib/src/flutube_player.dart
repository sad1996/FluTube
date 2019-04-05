import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class FluTube extends StatefulWidget {
  /// Youtube URL of the video
  final String videoUrl;
  final String apiKey;

  FluTube(this.videoUrl, this.apiKey, {Key key}) : super(key: key);

  @override
  FluTubeState createState() => FluTubeState();
}

class FluTubeState extends State<FluTube> {
  FlutterYoutube youtube;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            _videoThumbURL(widget.videoUrl),
            fit: BoxFit.cover,
          ),
          Center(
            child: ClipOval(
              child: Container(
                color: Colors.white,
                child: IconButton(
                  iconSize: 50.0,
                  color: Colors.black,
                  icon: Icon(
                    Icons.play_arrow,
                  ),
                  onPressed: () {
                    youtube = FlutterYoutube.playYoutubeVideoByUrl(
                        apiKey: widget.apiKey,
                        videoUrl: widget.videoUrl,
                        autoPlay: true, //default falase
                        fullScreen: true //default false
                    );
                    youtube.onVideoEnded.listen((onData) {
                      //if (mounted) Navigator.of(context).pop();
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _videoThumbURL(String yt) {
    String id = yt.substring(yt.indexOf('v=') + 2);
    if (id.contains('&')) id = id.substring(0, id.indexOf('&'));
    return "http://img.youtube.com/vi/$id/0.jpg";
  }
}
