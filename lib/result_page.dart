import 'package:bmi_calculator/my_buttons/my_button.dart';
import 'package:bmi_calculator/my_widget/container_data.dart';
import 'package:bmi_calculator/widget_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.result});

  final String result;

  String countResult() {
    double bmiCount = double.tryParse(result) ?? 0.0;
    if (bmiCount <= 18.5) {
      return 'Underweight';
    } else if (bmiCount <= 24.9) {
      return 'Normal';
    } else if (bmiCount <= 29.9) {
      return 'Overweight';
    } else if (bmiCount <= 39.9) {
      return 'Obese';
    } else {
      return 'Extreme Obese';
    }
  }

  Color getColor() {
    String category = countResult();

    if (category == 'Underweight') {
      return Colors.orange.shade400;
    } else if (category == 'Normal') {
      return Colors.green.shade400;
    } else if (category == 'Overweight') {
      return Colors.yellow.shade400;
    } else if (category == 'Obese') {
      return Colors.red.shade400;
    } else {
      return Colors.brown.shade900;
    }
  }

  AssetImage setImage() {
    String category = countResult();

    if (category == 'Underweight') {
      return AssetImage('assets/image/underweight.png');
    } else if (category == 'Normal') {
      return AssetImage('assets/image/normal.png');
    } else if (category == 'Overweight') {
      return AssetImage('assets/image/overweight.png');
    } else if (category == 'Obese') {
      return AssetImage('assets/image/obese.png');
    } else {
      return AssetImage('assets/image/extreme_obese.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackground,
        elevation: 16,
        title: Text('BMI Count', style: textStyle),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: white),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContainerData(
              width: MediaQuery.of(context).size.width,
              bgColor: onTap,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Your BMI value is ',
                      style: GoogleFonts.merienda(
                        fontWeight: FontWeight.w900,
                        color: white,
                        fontSize: 24,
                      ),
                    ),
                    Text(result, style: textStyle),
                    Text(
                      countResult(),
                      style: GoogleFonts.merienda(
                        color: getColor(),
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image(
              image: setImage(),
              height: MediaQuery.of(context).size.height * 0.55,
            ),
            MyButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'Calculate Again',
            ),
          ],
        ),
      ),
    );
  }
}

class TextData extends StatelessWidget {
  const TextData({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
