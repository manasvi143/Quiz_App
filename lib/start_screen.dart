import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onTap, {super.key});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/quiz1.png',
            alignment: Alignment.center,
            height: 350,
            width: 350,
          ),
          const SizedBox(
            height: 20,
          ),
          // const Text(
          //   'Press button to start quiz',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       fontSize: 28, color: Color.fromARGB(255, 255, 255, 255)),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          ElevatedButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Start Quiz'),
            style: ElevatedButton.styleFrom(
                alignment: AlignmentDirectional.centerStart,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
          ),
        ],
      ),
    );
  }
}
