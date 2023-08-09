import 'package:flutter/material.dart';
import 'package:prac3/data/question_data.dart';
import 'package:prac3/summry.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.myAnswers, this.onTap, {super.key});
  final List<String> myAnswers;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    int x = 0;
    for (int i = 0; i < myAnswers.length; i++) {
      if (myAnswers[i] == questions[i].ans[0]) {
        x++;
      }
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $x right out of ${questions.length} questions',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Summry(myAnswers),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.replay_rounded),
              label: const Text('Restart'),
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }
}
