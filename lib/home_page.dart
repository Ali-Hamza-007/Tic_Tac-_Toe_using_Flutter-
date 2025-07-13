import 'package:flutter/material.dart';
import 'names-page.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playMusic();
  }

  void _playMusic() async {
    await audioPlayer.play(AssetSource('Musics/homePageMusic.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    Color buttonBgColor = Colors.amber;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Developed By HAMZA </>',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromRGBO(30, 144, 255, 1),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Text(
                    'Tic Tac Toe ',
                    style: TextStyle(
                      wordSpacing: 2,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Image.asset('assets/tic-tac-toe.png', height: 200),
                SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    audioPlayer.stop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SinglePlayerName(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(buttonBgColor),
                    fixedSize: WidgetStatePropertyAll(Size(300, 50)),
                  ),
                  child: Text(
                    'Single Player (Play with Computer)',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    audioPlayer.stop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PlayersName()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(buttonBgColor),
                    fixedSize: WidgetStatePropertyAll(Size(300, 50)),
                  ),
                  child: Text(
                    'Multi Player (Play with Other Player)',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
