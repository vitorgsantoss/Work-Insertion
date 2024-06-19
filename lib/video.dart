import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'exercises.dart';
import 'marketing.dart';

class VideoApp extends StatefulWidget {
  final String videoPath;

  const VideoApp({Key? key, required this.videoPath}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  bool aula1Completed = false;
  bool exercisesCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _controller,
            autoPlay: false,
            looping: false,
            aspectRatio: _controller.value.aspectRatio,
            allowMuting: true,
            allowedScreenSleep: false,
            allowFullScreen: true,
            showControlsOnInitialize: true,
            showControls: true,
          );
        });
      });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aula 1'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child:
                  _controller.value.isInitialized && _chewieController != null
                      ? Chewie(
                          controller: _chewieController!,
                        )
                      : CircularProgressIndicator(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Conteúdo da Aula',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Ação para "Aula 1"
                          },
                          child: Text('Aula 1'),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            aula1Completed
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          onPressed: () {
                            setState(() {
                              aula1Completed = !aula1Completed;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExercisePage(),
                              ),
                            );
                          },
                          child: Text('Exercícios'),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            exercisesCompleted
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          onPressed: () {
                            setState(() {
                              exercisesCompleted = !exercisesCompleted;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CursoMarketing(),
                            ),
                          );
                        },
                        child: Text('Próxima aula'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CursoMarketing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próxima Aula'),
      ),
      body: Center(
        child: Text(
          'Bem-vindo à próxima aula de Marketing!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
