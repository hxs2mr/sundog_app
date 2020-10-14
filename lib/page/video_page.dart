import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//视频播放
class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController _controller;
  ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        'http://vfx.mtime.cn/Video/2019/03/18/mp4/190318214226685784.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 3 / 2, //宽高比
      autoPlay: false, //自动播放
      looping: false, //循环播放
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("视频标题"),
        ),
        body:SingleChildScrollView(
          child:  Column(
            children: [
              Chewie(
                controller: _chewieController,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child:  FlatButton(
                      onPressed: (){
                        _chewieController.enterFullScreen();
                      },
                      child: Text("全屏播放" )
                  )
              ),
               Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("阿萨德卢卡斯的阿塞拜疆大街上的悲剧啊是的撒室内阿瑟打算考虑的话啊说的话收到后会拉升的阿斯卡隆大量可视对讲"),
                  )

            ],

          )
        )  ,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      );

  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();

  }

}
