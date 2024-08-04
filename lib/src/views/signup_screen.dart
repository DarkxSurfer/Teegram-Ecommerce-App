import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/signin_func.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/views/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController FnameController = TextEditingController();
bool passToggle = true;

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(logo),
              const SizedBox(height: 20),
              const Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                child: TextFormField(
                  controller: FnameController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 10),
                      hintText: 'Full Name ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon: Icon(Icons.person_outline)),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(
                        right: 10, left: 10, top: 10, bottom: 10),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter valid Email";
                    } else if (!emailValid) {
                      return "Enter valid Email";
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                child: TextFormField(
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 10),
                      hintText: 'Password',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  validator: (value) {
                    setState(() {});
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (passController.text.length < 6) {
                      return "Password length should be more than 6";
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    signUp(context, emailController.text, passController.text);

                    emailController.clear();
                    passController.clear();
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA14F0),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text("Create Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Sign In")),
                ],
              ),
            ]),
      ),
    ));
  }
}
