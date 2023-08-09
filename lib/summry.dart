import 'package:flutter/material.dart';
import 'package:prac3/data/question_data.dart';

class Summry extends StatelessWidget {
  const Summry(this.choosenAnswer, {super.key});
  final List<String> choosenAnswer;

  List<Map<String, Object>> summryData() {
    List<Map<String, Object>> summry = [];
    for (int i = 0; i < choosenAnswer.length; i++) {
      summry.add({
        'question_index': i,
        'question': questions[i].ques,
        'correct_answer': questions[i].ans[0],
        'user_answer': choosenAnswer[i],
      });
    }
    return summry;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 420,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: summryData().map((temp) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: temp['user_answer'] == temp['correct_answer']
                          ? Colors.greenAccent
                          : const Color.fromARGB(255, 219, 115, 115),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    ((temp['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        temp['question'].toString(),
                        style: const TextStyle(
                          fontSize: 23,
                          color: Color.fromARGB(255, 28, 0, 0),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        temp['user_answer'].toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 2, 79, 247)),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        temp['correct_answer'].toString(),
                        style: const TextStyle(
                            fontSize: 20, color: Colors.deepPurple),
                      ),
                      const SizedBox(
                        height: 27,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
