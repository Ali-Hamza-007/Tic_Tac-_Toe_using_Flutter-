import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MultiPlayer extends StatefulWidget {
  final String player1;
  final String player2;

  const MultiPlayer({super.key, required this.player1, required this.player2});

  @override
  State<MultiPlayer> createState() => _MultiPlayerState();
}

class _MultiPlayerState extends State<MultiPlayer> {
  //For Music
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playMusic();
  }

  void _playMusic() async {
    await audioPlayer.play(AssetSource('Musics/onBoardMusic.mp3'));
  }

  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  final List<List<int>> winningCombinations = [
    [0, 1, 2], // row 1
    [3, 4, 5], // row 2
    [6, 7, 8], // row 3
    [0, 3, 6], // col 1
    [1, 4, 7], // col 2
    [2, 5, 8], // col 3
    [0, 4, 8], // diagonal
    [2, 4, 6], // diagonal
  ];
  void showEndDialog(String result) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            backgroundColor:
                currentPlayer == 'O' ? Colors.greenAccent : Colors.yellow,

            title: Text(result),
            actions: [
              result == 'It\'s a Draw!'
                  ? Image.asset('assets/wheel.png', height: 80)
                  : Image.asset('assets/trophy.png', height: 80),
              TextButton(
                onPressed: () {
                  audioPlayer.resume();
                  Navigator.of(context).pop(); // close dialog
                  setState(() {
                    board = List.filled(9, '');
                    currentPlayer = 'X';
                  });
                },
                child: const Text('Play Again'),
              ),
            ],
          ),
    );
  }

  void checkWinner() {
    for (var combo in winningCombinations) {
      final a = combo[0];
      final b = combo[1];
      final c = combo[2];

      if (board[a] != '' && board[a] == board[b] && board[a] == board[c]) {
        String winnerName = board[a] == 'X' ? widget.player1 : widget.player2;
        audioPlayer.pause();
        showEndDialog('wohoo ... $winnerName wins!');
        return;
      }
    }

    // Draw check
    if (!board.contains('')) {
      showEndDialog("It's a Draw!");
    }
  }

  void _handleTap(int index) {
    if (board[index] == '') {
      setState(() {
        board[index] = currentPlayer;
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
    }
    checkWinner();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 144, 255, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(30, 144, 255, 1),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  board = List.filled(9, '');
                  currentPlayer = 'X';
                });
              },
              icon: const Icon(Icons.refresh, color: Colors.white),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'Tic Tac Toe',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.player1,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.player2,
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Text(
                      'X',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 32),
                    child: Text(
                      'O',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Expanded(
                child: SizedBox(
                  width: 350,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 3,
                        ),
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              board[index] == ''
                                  ? Colors.white
                                  : (board[index] == 'X'
                                      ? Colors.greenAccent
                                      : Colors.yellow),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => _handleTap(index),
                        child: Text(
                          board[index],
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
