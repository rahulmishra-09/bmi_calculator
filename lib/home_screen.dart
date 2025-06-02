import 'package:bmi_calculator/my_buttons/my_button.dart';
import 'package:bmi_calculator/my_widget/container_data.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/widget_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_buttons/card_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedGender;
  double currentHeight = 160.0;
  int ageCount = 20;
  double weightCount = 40;
  Color tapColor = onTap;

  void changeGenderBackground(bool gender) {
    if (gender) {
      setState(() {
        tapBackgroundMale = newTap;
        tapBackgroundFemale = tapBackground;
      });
    } else {
      tapBackgroundFemale = newTap;
      tapBackgroundMale = tapBackground;
    }
  }

  double calculateBMI(double heightCm, double weightKg) {
    double heightMeter = heightCm / 100;
    return weightKg / (heightMeter * heightMeter);
  }

  void resetData() {
    setState(() {
      selectedGender = null;
      currentHeight = 160;
      ageCount = 20;
      weightCount = 40;
      tapBackgroundMale = tapBackground;
      tapBackgroundFemale = tapBackground;
    });
  }

  void validationData() {
    if (selectedGender != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => ResultPage(
                result: calculateBMI(
                  currentHeight,
                  weightCount,
                ).toStringAsFixed(2),
              ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          content: Center(
            child: Text(
              'Select Gender First!',
              style: GoogleFonts.merienda(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: GoogleFonts.merienda(
            fontWeight: FontWeight.w800,
            color: headingText,
          ),
        ),
        backgroundColor: appBarBackground,
        elevation: 16,
        actions: [
          Tooltip(
            message: 'Refresh',
            child: IconButton(
              onPressed: () {
                resetData();
              },
              icon: Icon(Icons.refresh, color: headingText),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeGenderBackground(true);
                        selectedGender = 'Male';
                      });
                    },
                    child: ContainerData(
                      bgColor: tapBackgroundMale,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.male, size: 120, color: grey),
                          Text('Male', style: textStyle),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeGenderBackground(false);
                        selectedGender = 'Female';
                      });
                    },
                    child: ContainerData(
                      bgColor: tapBackgroundFemale,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.female, size: 120, color: grey),
                          Text('Female', style: textStyle),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerData(
              width: MediaQuery.of(context).size.width,
              bgColor: tapBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: textStyle),
                  Text(
                    '${currentHeight.toStringAsFixed(1)} cm',
                    style: textStyle,
                  ),
                  Slider(
                    activeColor: Colors.teal,
                    thumbColor: Colors.redAccent,
                    inactiveColor: Colors.teal[200],
                    value: currentHeight,
                    max: 272,
                    min: 54.6,
                    divisions: 100,
                    label: currentHeight.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        currentHeight = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerData(
                    bgColor: tapBackground,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('AGE', style: textStyle),
                        Text('$ageCount', style: textStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardButton(
                              onPressed: () {
                                setState(() {
                                  if (ageCount > 1) {
                                    ageCount--;
                                  }
                                });
                              },
                              iconData: Icons.remove,
                            ),
                            CardButton(
                              onPressed: () {
                                setState(() {
                                  if (ageCount < 120) {
                                    ageCount++;
                                  }
                                });
                              },
                              iconData: Icons.add,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerData(
                    bgColor: tapBackground,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('WEIGHT', style: textStyle),
                        Text('$weightCount', style: textStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardButton(
                              onPressed: () {
                                setState(() {
                                  if (weightCount > 5) {
                                    weightCount--;
                                  }
                                });
                              },
                              iconData: Icons.remove,
                            ),

                            CardButton(
                              onPressed: () {
                                setState(() {
                                  if (weightCount < 500) {
                                    weightCount++;
                                  }
                                });
                              },
                              iconData: Icons.add,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MyButton(text: 'Calculate BMI', onTap: validationData),
        ],
      ),
    );
  }
}
