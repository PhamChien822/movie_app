import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import '../../../providers/themeprovider.dart';
import '../../../theme/apptextstyles.dart';
import '../../constants/auth_constants.dart';
import '../../router/nameroute.dart';
import 'appbutton.dart';

class OTPInputFeild extends StatefulWidget {
  final Color borderColor;

  final Color borderActiveColor;
  final Color? backgroundColor;

  final Color backgroundActiveColor;

  const OTPInputFeild(
      {super.key,
      required this.borderColor,
      required this.borderActiveColor,
      required this.backgroundColor,
      required this.backgroundActiveColor});

  @override
  State<OTPInputFeild> createState() => _OTPInputFeildState();
}

class _OTPInputFeildState extends State<OTPInputFeild>
    {
  final TextEditingController _controller = TextEditingController();
  final List<String> _characters = List.generate(4, (index) => "");
  List<Color> borderColors = [];
  List<Color> backgroundColors = [];
  String otpCodeReceived = "1234";
  String otpCode = "";
  String errorText = "";
  bool isDarkMode = false;





  void _onTextChanged(String text) {
    setState(() {
      for (int index = 0; index < _characters.length; index++) {
        if (index < text.length) {
          _characters[index] = text[index];
          borderColors[index] = widget.borderActiveColor;
          backgroundColors[index] = widget.backgroundActiveColor;
        } else {
          _characters[index] = "";
          borderColors[index] = widget.borderColor;
          backgroundColors[index] = widget.backgroundColor!;
        }
      }
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _onTextChanged(_controller.text);
  }
  @override
  void initState() {
    super.initState();
    borderColors = List.generate(4, (index) => widget.borderColor);
    backgroundColors = List.generate(4, (index) => widget.backgroundColor!);
    _controller.addListener(() {
      _onTextChanged(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Card(
                  color: backgroundColors[index],
                  //
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: borderColors[index], width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: SizedBox(
                        width: 10,
                        height: 25,
                        child: Text(
                          _characters[index],
                          style: AppTextStyle.otpTextStyle.copyWith(
                              color: themeProvider
                                  .currentTheme.colorScheme.onPrimary),
                        )),
                  ),
                );
              }),
            ),
            Opacity(
              opacity: 0,
              child: TextField(
                controller: _controller,
                maxLength: 4,
                showCursor: false,
                maxLines: 1,

                // Gắn focus node vào từng ô
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),

                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ],
        ),
        SizedBox(
          height: errorText == "" ? 20 : 50,
          child: Text(
            errorText,
            style: AppTextStyle.errorAuthTextStyle,
          ),
        ),
        AppButtonLogin(
            text: "Reset Password",
            onPressed: _controller.text.length == 4
                ? () => verifyOtpCode(context)
                : null)
      ],
    );
  }

  Future<void> verifyOtpCode(BuildContext context) async {
    final currentContext = context;
    if (_controller.text == otpCodeReceived) {

      setState(() {
        errorText = "";
      });
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
      setState(() {
        errorText = AuthConstants.errorWrongOTPCode;
      });
    }
  }
}
