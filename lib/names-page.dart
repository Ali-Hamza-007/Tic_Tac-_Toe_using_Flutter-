import 'package:flutter/material.dart';
import 'package:tic_tac_toe/multi_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'single_player.dart';

class PlayersName extends StatefulWidget {
  const PlayersName({super.key});

  @override
  State<PlayersName> createState() => _PlayerNameState();
}

class _PlayerNameState extends State<PlayersName> {
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();
  String player1Name = '';
  String player2Name = '';

  // For Music
  AudioPlayer audioPlayer = AudioPlayer();
  void playMusic() async {
    await audioPlayer.play(AssetSource('Musics/namePageMusic.mp3'));
  }

  @override
  void initState() {
    super.initState();
    playMusic();
  }

  @override
  void dispose() {
    _player1Controller.dispose();
    _player2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(30, 144, 255, 1),

          title: Text(
            'Tic Tac Toe ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromRGBO(30, 144, 255, 1),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s fun !!!',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
              Text(
                'Welcome to ',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              //  SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Brain Storming Game',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 100),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 212, 212, 81),
                ),
                child: TextField(
                  controller: _player1Controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //  prefixText: 'Player1',
                    hintText: 'Player1 Name ',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 15),

              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 212, 212, 81),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextField(
                  controller: _player2Controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Player2 Name ',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              //SizedBox(height: 100),
              Spacer(),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(200, 5)),
                    backgroundColor: WidgetStatePropertyAll(Colors.teal),
                  ),
                  onPressed: () {
                    player1Name = _player1Controller.text.trim();
                    player2Name = _player2Controller.text.trim();

                    if (player1Name.isEmpty || player2Name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Please enter names for both players',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                      return;
                    }
                    audioPlayer.stop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => MultiPlayer(
                              player1: player1Name,
                              player2: player2Name,
                            ),
                      ),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Single Player Page

class SinglePlayerName extends StatefulWidget {
  const SinglePlayerName({super.key});

  @override
  State<SinglePlayerName> createState() => _SinglePlayerNameState();
}

class _SinglePlayerNameState extends State<SinglePlayerName> {
  String playerName = '';
  final TextEditingController playerNameController = TextEditingController();

  // For Music
  AudioPlayer audioPlayer = AudioPlayer();
  void playMusic() async {
    await audioPlayer.play(AssetSource('Musics/namePageMusic.mp3'));
  }

  @override
  void initState() {
    super.initState();
    playMusic();
  }

  @override
  void dispose() {
    super.dispose();
    playerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(30, 144, 255, 1),

          title: Text(
            'Tic Tac Toe ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromRGBO(30, 144, 255, 1),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s fun !!!',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
              Text(
                'Welcome to ',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              //  SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Brain Storming Game',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 100),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 212, 212, 81),
                ),
                child: TextField(
                  controller: playerNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //  prefixText: 'Player1',
                    hintText: 'Player Name ',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 15),

              //SizedBox(height: 100),
              Spacer(flex: 2),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(200, 5)),
                    backgroundColor: WidgetStatePropertyAll(Colors.teal),
                  ),
                  onPressed: () {
                    playerName = playerNameController.text.trim();

                    if (playerName.isEmpty || playerName.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Please enter names for player',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                      return;
                    }
                    audioPlayer.stop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => SinglePlayer(
                              player1: playerName,
                              player2: 'Computer',
                            ),
                      ),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              //SizedBox(height: 40),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
