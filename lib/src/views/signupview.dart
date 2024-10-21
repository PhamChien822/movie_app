import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRetypeController = TextEditingController();
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isRetypePasswordValid = false;
  final TextStyle baseTextStyle = GoogleFonts.baloo2(fontSize: 18);
  final TextStyle hintTextStyle = GoogleFonts.baloo2(fontSize: 15, color: Colors.blueGrey);
  final TextStyle buttonTextStyle = GoogleFonts.baloo2(fontSize: 18, color: Colors.white);
  final Color buttonColor = Color.fromRGBO(70,140,255,1);
  final  double sizeIcon = 100.0;
  void _validateInputs() {
    setState(() {
      _isNameValid = _nameController.text.isNotEmpty;
      _isEmailValid = _emailController.text.contains('@');
      _isPasswordValid = _passwordController.text.length >= 8;
    });
  }

  void _validateRetypePassword() {
    setState(() {
      _isRetypePasswordValid =
          _passwordController.text == _passwordRetypeController.text &&
              _isPasswordValid == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight, // Bắt đầu từ trên cùng
              end: Alignment.bottomLeft, // Kết thúc ở dưới cùng
              colors: [
                Color.fromRGBO(204, 238, 216, 1), // Màu ở trên
                Color.fromRGBO(237, 214, 244, 1), // Màu ở dưới
              ],
            ),
          ),
        ),
        Container(
          color: Color.fromRGBO(255, 255, 255, 0.25),
        ),
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [

    Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: SizedBox(
        height: 150,
        width: 150, // Đặt chiều rộng bằng chiều cao để giữ hình tròn
        child: ClipOval(
        child:  Image.asset(
        'assets/images/Logo_app.png', // Thay đổi link logo tại đây
        fit: BoxFit.cover, // Giữ tỷ lệ hình ảnh
        ),

        ),
        ),
      ),
    ),





            Center(
              child: Text(
                  'Create New Account',
                  style:baseTextStyle.copyWith(fontSize: 25,fontWeight: FontWeight.bold)
                ),
            ),



            textFieldItem(
                "Name","Enter your name", _nameController, _validateInputs, _isNameValid),
            textFieldItem(
                "Email","Enter your email", _emailController, _validateInputs, _isEmailValid),
            textFieldItem("Password","Enter your password", _passwordController, _validateInputs,
                _isPasswordValid,
                isPasswordFeild: true),
            textFieldItem("Retype Password","Enter your retype password", _passwordRetypeController,
                _validateRetypePassword, _isRetypePasswordValid,
                isPasswordFeild: true),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0), // Khoảng cách trước nút Sign-Up
              child: Center(
                  child: Container(
                    width: double.infinity, // Đặt chiều rộng đầy đủ

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(

                        backgroundColor: buttonColor, // Đặt màu nền cho button

                      //  disabledBackgroundColor: buttonColor,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18), // Đặt bán kính bo tròn
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15), // Đặt padding cho button
                        elevation: 0, // Đặt độ cao của button là 0 để không có viền bóng
                      ),
                      onPressed:  () {
                        // Thực hiện logic đăng ký ở đây
                      }
                          ,
                      child: Text(
                        "Register",
                        style: buttonTextStyle,
                      ),
                    ),
                  )
                ,
              ),
            ),
             Padding(
              padding: EdgeInsets.only(top: 10.0), // Khoảng cách cho chữ "or"
              child: Center(
                child: Text('or', style: baseTextStyle.copyWith(color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,
                  bottom: 50), // Khoảng cách cho icon mạng xã hội
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/images/logos/google.svg', // Replace with actual SVG URL
                    height: 50,
                    width: 50,
                  ),
                  SvgPicture.asset(
                    'assets/images/logos/facebook.svg', // Replace with actual SVG URL
                    height: 50,
                    width: 50,
                  ),
                  SvgPicture.asset(
                    'assets/images/logos/gmail.svg', // Replace with actual SVG URL
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

Widget textFieldItem(String label,String hintText, TextEditingController controller,
    Function onChanged, bool isValid,
    {bool isPasswordFeild = false}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          label,
          style: GoogleFonts.baloo2(fontSize: 18)
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 4,right: 4,top:4),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15,color: Colors.blueGrey),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0),
            ),
            filled: true,
            fillColor: Colors
                .white,
          ),
        ),
      )
    ],
  );
}
