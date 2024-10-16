import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String base64String;

  // final IconButton childWidget;

  const AudioPlayerWidget({
    Key? key,
    required this.base64String,
  }) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late FlutterSoundPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = FlutterSoundPlayer();
    _audioPlayer.openPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.closePlayer();
    super.dispose();
  }

  void _togglePlayer() async {
    if (_isPlaying) {
      await _audioPlayer.stopPlayer();
    } else {
      Uint8List audioData = decodeAudioFromBase64(widget.base64String);
      await _audioPlayer.startPlayer(
        fromDataBuffer: audioData,
        codec: Codec.mp3, // Adjust codec based on your audio format
      );
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon((Icons.volume_up)),
      onPressed: _togglePlayer,
    );
    //   InkWell(
    //   onTap: _togglePlayer,
    //   // child: widget.childWidget,
    // );
  }
}

Uint8List decodeAudioFromBase64(String base64String) {
  Uint8List bytes = base64.decode(base64String);
  return bytes;
}
