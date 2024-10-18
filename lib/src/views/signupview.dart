import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              padding:
                  const EdgeInsets.only(top: 80.0), // Thay thế SizedBox bằng Padding
              child: Text(
                'Create New Account',
                style:GoogleFonts.baloo2(fontSize: 15,)
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 50), // Thêm khoảng cách bên trên
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sign in to watch more movie',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            ),
      
            textFieldItem(
                "Name", _nameController, _validateInputs, _isNameValid),
            textFieldItem(
                "Email", _emailController, _validateInputs, _isEmailValid),
            textFieldItem("Password", _passwordController, _validateInputs,
                _isPasswordValid,
                isPasswordFeild: true),
            textFieldItem("Retype Password", _passwordRetypeController,
                _validateRetypePassword, _isRetypePasswordValid,
                isPasswordFeild: true),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0), // Khoảng cách trước nút Sign-Up
              child: Center(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(72,122,255, 1),
                    borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: _isNameValid && _isEmailValid && _isPasswordValid
                        ? () {
                            // Perform sign-up logic here
                          }
                        : null,
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    )),
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0), // Khoảng cách cho chữ "or"
              child: Center(
                child: Text('or', style: TextStyle(color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0), // Khoảng cách cho icon mạng xã hội
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.g_translate, color: Colors.red),
                    onPressed: () {
                      // Google sign-up logic
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () {
                      // Facebook sign-up logic
                    },
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.flutter_dash, color: Colors.lightBlue),
                    onPressed: () {
                      // Twitter sign-up logic
                    },
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

Widget textFieldItem(String label, TextEditingController controller,
    Function onChanged, bool isValid,
    {bool isPasswordFeild = false}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 4,right: 4,top:4),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter your name',
            hintStyle: TextStyle(fontSize: 14,color: Colors.blueGrey),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
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
