import 'dart:io';

import 'package:besafe/presentation/screens/welcome_login/auth.dart';
import 'package:besafe/presentation/screens/welcome_login/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../components/component.dart';
import '../mqtt/mqtt/MQTTManager.dart';
import '../mqtt/mqtt/state/MQTTAppState.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool _obsecured = true;
  late MQTTAppState currentAppState;
  late MQTTManager manager;


  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Auth()));
  }


  void _configureAndConnect() {
    String osPrefix = 'Flutter_Android';
    if (Platform.isAndroid) {
      osPrefix = 'Flutter_iOS';
    }
    manager = MQTTManager(
        host: "mqtt-dashboard.com",
        topic: "hassan_yomna",
        identifier: osPrefix,
        state: currentAppState);
    try {
      manager.initializeMQTTClient();
      manager.connect();
      print("connection");
    } catch (e) {
      print("error is $e");
    }
  }

  void _buildConnect(MQTTAppConnectionState state) {
    state == MQTTAppConnectionState.disconnected ? _configureAndConnect : null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('assets/images/login.png'),
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.verified_user),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.lightBlue),
                              borderRadius: BorderRadius.circular(25)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.lightBlue),
                              borderRadius: BorderRadius.circular(25)),
                          labelText: 'email',
                          hintText: 'write your name....'),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'you must write email';
                        } else if (value.split('@').last != 'gmail.com') {
                          return 'email must end with @gmail.com';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: _obsecured,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _obsecured = !_obsecured;
                                });
                              },
                              child: Icon(_obsecured
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.lightBlue),
                              borderRadius: BorderRadius.circular(25)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.lightBlue),
                              borderRadius: BorderRadius.circular(25)),
                          labelText: 'password',
                          hintText: 'write your password....'),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'you must write Password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (_) => Home()));
                        // }
                        signIn();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.indigo,
                      )),
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Have an Account ? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Registration()));
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
