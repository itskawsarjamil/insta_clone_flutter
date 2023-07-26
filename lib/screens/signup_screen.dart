import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameeditingController =
      TextEditingController();
  final TextEditingController _emaileditingController = TextEditingController();
  final TextEditingController _passwordeditingController =
      TextEditingController();
  final TextEditingController _bioeditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
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
              const Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      "https://wallpapers.com/images/high/cool-profile-picture-2we7xmn0737hqgtu.webp",
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 5,
                    child: Icon(
                      Icons.add_a_photo,
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
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Sign Up"),
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
                      onPressed: () {},
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
  }
}
