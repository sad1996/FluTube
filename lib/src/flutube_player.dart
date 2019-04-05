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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: 16 / 9,
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
                      iconSize: 30.0,
                      color: Colors.black,
                      icon: Icon(
                        Icons.play_arrow,
                      ),
                      onPressed: () {
                        FlutterYoutube.playYoutubeVideoByUrl(
                            apiKey: widget.apiKey,
                            videoUrl: widget.videoUrl,
                            autoPlay: true, //default falase
                            fullScreen: true //default false
                            );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _videoThumbURL(String yt) {
    String id = yt.substring(yt.indexOf('v=') + 2);
    if (id.contains('&')) id = id.substring(0, id.indexOf('&'));
    return "http://img.youtube.com/vi/$id/0.jpg";
  }
}
