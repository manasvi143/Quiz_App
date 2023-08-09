import 'package:flutter/material.dart';
import 'package:prac3/data/question_data.dart';
import 'package:prac3/model/answer_button.dart';

class NewScreen extends StatefulWidget {
  const NewScreen(this.myPics, {super.key});
  final void Function(String ansans) myPics;

  @override
  State<NewScreen> createState() {
    return _NewScreenState();
  }
}

class _NewScreenState extends State<NewScreen> {
  int i = 0;

  void questionChanger(String ansans) {
    widget.myPics(ansans);
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currQues = questions[i];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currQues.ques,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currQues.ans.map((temp) {
            return AnswerButton(
              answer: temp,
              onTap: () => questionChanger(temp),
            );
          })
        ],
      ),
    );
  }
}
