import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FluTube extends StatelessWidget {
  FluTube(this.videoUrl, this.apiKey);

  /// Youtube URL of the video
  final String videoUrl;
  final String apiKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Theme.of(context).dividerColor)),
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              CachedNetworkImage(
                key: UniqueKey(),
                imageUrl: _videoThumbURL(videoUrl),
                fit: BoxFit.cover,
              ),
              Center(
                child: ClipOval(
                  child: Container(
                    color: Colors.white,
                    child: IconButton(
                      iconSize: 40.0,
                      color: Colors.black,
                      icon: Icon(
                        Icons.play_arrow,
                      ),
                      onPressed: () {
                        FlutterYoutube.playYoutubeVideoByUrl(
                            apiKey: apiKey,
                            videoUrl: videoUrl,
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
    var id = FlutterYoutube.getIdFromUrl(yt);
    return "http://img.youtube.com/vi/$id/0.jpg";
  }
}
