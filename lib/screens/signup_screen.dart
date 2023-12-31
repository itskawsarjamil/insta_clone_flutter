import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/resources/auth_method.dart';
import 'package:insta_clone/screens/login_screen.dart';
import 'package:insta_clone/utils/utils.dart';
import 'package:insta_clone/widgets/text_field_input.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  final TextEditingController _usernameeditingController =
      TextEditingController();
  final TextEditingController _emaileditingController = TextEditingController();
  final TextEditingController _passwordeditingController =
      TextEditingController();
  final TextEditingController _bioeditingController = TextEditingController();
  Uint8List? _img;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameeditingController.dispose();
    _emaileditingController.dispose();
    _passwordeditingController.dispose();
    _bioeditingController.dispose();
  }

  void userSignUp() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().signUpUser(
      email: _emaileditingController.text,
      bio: _bioeditingController.text,
      file: _img!,
      password: _passwordeditingController.text,
      username: _usernameeditingController.text,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnakBar(res, context);
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const ResponsiveLayout(
          webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout(),
        );
      }));
    }
  }

  void imagePick() async {
    Uint8List _im = await pickImage(ImageSource.gallery);

    setState(() {
      _img = _im;
    });
  }

  double mxheight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight > mxheight) {
              mxheight = constraints.maxHeight;
            }
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: mxheight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(),
                        flex: 2,
                      ),
                      SvgPicture.asset("assets/images/ic_instagram.svg"),
                      Flexible(
                        child: Container(),
                        flex: 1,
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundImage:
                                _img != null ? MemoryImage(_img!) : null,
                            child: const Icon(
                              Icons.person,
                              size: 64,
                            ),
                          ),
                          Positioned(
                            right: 12,
                            bottom: 5,
                            child: GestureDetector(
                              onTap: () {
                                imagePick();
                              },
                              child: const Icon(
                                Icons.add_a_photo,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFieldWidget(
                          textEditingController: _usernameeditingController,
                          textInputType: TextInputType.text,
                          textHint: "Enter your username"),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFieldWidget(
                          textEditingController: _emaileditingController,
                          textInputType: TextInputType.emailAddress,
                          textHint: "Enter your email"),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFieldWidget(
                        textEditingController: _passwordeditingController,
                        textInputType: TextInputType.text,
                        textHint: "Enter your username",
                        isPass: true,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFieldWidget(
                          textEditingController: _bioeditingController,
                          textInputType: TextInputType.text,
                          textHint: "Enter your bio"),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            userSignUp();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: _isLoading == true
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text("Sign Up"),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(),
                        flex: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already Have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Log in",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
