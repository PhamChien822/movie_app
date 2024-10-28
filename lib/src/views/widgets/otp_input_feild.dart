import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/router/nameroute.dart';
import 'package:movie_app/theme/apptextstyles.dart';
import 'package:toastification/toastification.dart';

import '../../../theme/appcolors.dart';
import '../../constants/auth_costants.dart';
import 'appbutton.dart';

class OtpInputFeild extends StatefulWidget {
  const OtpInputFeild({super.key});

  @override
  State<OtpInputFeild> createState() => OtpInputFeildState();
}

class OtpInputFeildState extends State<OtpInputFeild> {
  String otpCodeReceived = "1234";
  String otpCode = "";
  String errorText = "";

  List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());
  List<Color> borderColors = List.generate(4, (index) => AppColors.borderColor);
  List<Color> backgroundColors =
      List.generate(4, (index) => AppColors.backgroundInputFieldColor);
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void _updateBorderColor(int index) {
    setState(() {
      if (otpControllers[index].text.isNotEmpty) {
        borderColors[index] = AppColors.borderActive;
        backgroundColors[index] = Colors.white;
      } else {
        borderColors[index] = AppColors.borderColor;
        backgroundColors[index] = AppColors.backgroundInputFieldColor;
      }
    });
  }

  void _moveToNextField(int index) {
    if (otpControllers[index].text.isNotEmpty && index < 3) {
      FocusScope.of(context)
          .requestFocus(focusNodes[index + 1]); // Di chuyển đến ô tiếp theo
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return KeyboardListener(
      focusNode: FocusNode(), // Cần để lắng nghe các sự kiện bàn phím
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace) {
          for (int i = 0; i < otpControllers.length; i++) {
            if (otpControllers[i].text.isEmpty && i > 0) {
              FocusScope.of(context).requestFocus(focusNodes[i - 1]);
              otpControllers[i - 1].clear();
              _updateBorderColor(i - 1);
              break;
            }
          }
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    color: backgroundColors[index],
                    width: width * 0.15,
                    child: TextField(
                      showCursor: false,
                      controller: otpControllers[index],
                      maxLength: 1,
                      focusNode: focusNodes[index],
                      // Gắn focus node vào từng ô
                      textAlign: TextAlign.center,
                      style: AppTextStyle.otpTextStyle,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        counterText: "", // Ẩn bộ đếm ký tự
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: borderColors[index], width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: borderColors[index], width: 1),
                        ),
                      ),
                      onChanged: (value) {
                        _updateBorderColor(
                            index); // Gọi hàm cập nhật màu khi thay đổi giá trị
                        _moveToNextField(
                            index); // Chuyển sang ô tiếp theo sau khi nhập
                        otpCode = otpControllers
                            .map((controller) => controller.text)
                            .join();
                      },
                    ),
                  ),
                );
              }),
            ),
            Container(
              height: errorText == "" ? 20 : 50,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                errorText,
                style: AppTextStyle.errorAuthTextStyle,
              ),
            ),
            AppButtonLogin(
                text: "Reset Password",
                onPressed: otpCode.length == 4
                    ? () =>verifyOtpCode(context)
                    : null)
          ],
        ),
      ),
    );
  }
  Future<void> verifyOtpCode(BuildContext context) async {
    final currentContext = context;
    if (otpCode == otpCodeReceived) {
      errorText = "";
      toastification.show(
        context: context,
        // optional if you use ToastificationWrapper
        title: Text('Success'),
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 2),
      );
      await Future.delayed(Duration(seconds: 2));
      if (currentContext.mounted) {
        context.go(NameRoute.homeScreen);
      }
    } else {
      errorText = AuthConstants.errorWrongOTPCode;
    }
  }
}
