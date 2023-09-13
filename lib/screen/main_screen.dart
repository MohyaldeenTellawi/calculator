import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
import '../controller/theme_controller.dart';
import '../controller/calculate_controller.dart';
import '../utils/colors.dart';
import '../widget/button.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<String> buttons = [
    "AC",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ",",
    "Ans",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: ColorS.scaffoldBgColor,
        body: Column(
          children: [
            GetBuilder<CalculateController>(builder: (context) {
              return outPutSection(themeController, controller);
            }),
            inPutSection(themeController, controller),
          ],
        ),
      );
    });
  }

  Expanded inPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        flex: 2,
        child: Container(
          width: 400,
          height: 350,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return MyButton(
                        buttonTapped: () {
                          controller.clearInputAndOutput();
                        },
                        color: ColorS.btnBgColor,
                        textColor: ColorS.leftOperatorColor,
                        text: buttons[index]);

                  case 1:
                    return MyButton(
                        buttonTapped: () {
                          controller.deleteBtnAction();
                        },
                        color: ColorS.btnBgColor,
                        textColor: ColorS.leftOperatorColor,
                        text: buttons[index]);
                  case 2:
                    return MyButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttons, index);
                        },
                        color: ColorS.btnBgColor,
                        textColor: ColorS.leftOperatorColor,
                        text: buttons[index]);
                  case 3:
                    return MyButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttons, index);
                        },
                        color: ColorS.btnBgColor2,
                        textColor: ColorS.textColor,
                        text: buttons[index]);
                  case 7:
                    return MyButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttons, index);
                        },
                        color: ColorS.btnBgColor2,
                        textColor: ColorS.textColor,
                        text: buttons[index]);
                  case 11:
                    return MyButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttons, index);
                        },
                        color: ColorS.btnBgColor2,
                        textColor: ColorS.textColor,
                        text: buttons[index]);
                  case 15:
                    return MyButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttons, index);
                        },
                        color: ColorS.btnBgColor2,
                        textColor: ColorS.textColor,
                        text: buttons[index]);

                  case 19:
                    return MyButton(
                        buttonTapped: () {
                          controller.equalPressed();
                        },
                        color: ColorS.btnBgColor2,
                        textColor: ColorS.textColor,
                        text: buttons[index]);

                  default:
                    return MyButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttons, index);
                        },
                        color: ColorS.btnBgColor3,
                        textColor: Colors.white,
                        text: buttons[index]);
                }
              }),
        ));
  }

  Expanded outPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        child: Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                alignment: Alignment.centerRight,
                child: Text(
                  controller.userInput,
                  style: TextStyle(
                      color:
                          themeController.isDark ? Colors.white : Colors.black,
                      fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(controller.userOutput,
                    style: TextStyle(
                        color: themeController.isDark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 32)),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  ///
  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }
}
