
import 'package:besafe/components/component.dart';
import 'package:besafe/presentation/screens/welcome_login/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class Registration extends StatefulWidget {
  const Registration({super.key});
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fNameController = TextEditingController();
  var sNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool _obsecured = true;

   Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
     password: passwordController.text.trim());
      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Auth()));
 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/L.png',
                          scale: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          controller: fNameController,
                         validate: ( value) {
                            if (value == null || value.isEmpty) {
                              return 'Second Name must not be empty';
                            }else{
                               return null;
                            }
                           
                          },
                          type: TextInputType.text,
                          label: 'First Name',
                          prefix: Icons.person),
                      const SizedBox(height: 20),
                      defaultFormField(
                          controller: sNameController,
                          validate: ( value) {
                            if (value == null || value.isEmpty) {
                              return 'Second Name must not be empty';
                            }else{
                               return null;
                            }
                           
                          },
                          type: TextInputType.text,
                          label: 'Second Name',
                          prefix: Icons.person),
                      const SizedBox(height: 20),
                      defaultFormField(
                          controller: emailController,
                          validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'you must write email';
                    } else if (value.split('@').last != 'gmail.com') {
                      return 'email must end with @gmail.com';
                    } else {
                      return null;
                    }
                  },
                          type: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icons.email),
                      const SizedBox(height: 20),
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
                            borderSide: BorderSide(color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(25)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
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
                      const SizedBox(height: 20),
                      defaultButton(
                        text: 'Sign Up',
                        radius: 20,
                        function: () {
                          //  if (formKey.currentState!.validate())
                          //  {
                          //   RegisterCubit.get(context).userRegiter(
                          //    fistName:fNameController.text,
                          //    lastName:sNameController.text,
                          //    email: emailController.text,
                          //    password: passwordController.text,
                          //   );
                            


                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const Home()));
                          signUp(); 
                          }
                            // },
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}