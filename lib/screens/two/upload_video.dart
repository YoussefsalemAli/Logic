import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  XFile? selectedVideo;
  VideoPlayerController? _videoController;
  Future<void> _uploadVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      await _videoController?.dispose();

      _videoController = VideoPlayerController.file(File(pickedVideo.path));
      await _videoController?.initialize();
      setState(() {
        selectedVideo = pickedVideo;
      });
      _videoController!.play();
      _videoController!.setLooping(true);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_videoController != null) {
      _videoController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900.withRed(10),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 90),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
                  _videoController != null &&
                      _videoController!.value.isInitialized
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: _videoController!.value.aspectRatio,
                        child: VideoPlayer(_videoController!),
                      ),
                    )
                  : Icon(Icons.file_copy_outlined),
            ),
            SizedBox(height: 30),
            _videoController != null && _videoController!.value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_videoController!.value.isPlaying) {
                          _videoController!.pause();
                        } else {
                          _videoController!.play();
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 180,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(
                          _videoController!.value.isPlaying
                              ? Icons.pause_outlined
                              : Icons.play_arrow_rounded,
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(height: 15),
            GestureDetector(
              onTap: _uploadVideo,
              child: Container(
                height: 40,
                width: 180,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Upload-Video',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
