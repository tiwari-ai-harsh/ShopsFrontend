import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_frontend/ui/views/signup/signup_viewmodel.dart';
import 'package:shop_frontend/ui/widgets/raised_gradient_button.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      builder: (context, model, child) => Center(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: Container(
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.darken,
              gradient: LinearGradient(
                colors: [Colors.amber, Colors.white, Colors.amber],
                begin: Alignment(-3.0, -3.0),
                end: Alignment(3.0, 3.0),
              ),
            ),
            child: Column(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                SizedBox(
                  height: 110,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: model.popBack,
                      icon: Icon(Icons.arrow_back_ios),
                      color: Color.fromRGBO(36, 59, 85, 1),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(69, 89, 122, 1),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     TextFormField(
                //         // controller: text,
                //         // onChanged: viewModel.updateEmailForm,
                //         // style: TextStyle(color: Colors.black),
                //         // decoration: InputDecoration(
                //         //   labelText: "UserName",
                //         //   labelStyle: TextStyle(
                //         //     color: Color.fromRGBO(222, 222, 222, 1),
                //         //     fontWeight: FontWeight.w400,
                //         //   ),
                //         //   focusedBorder: OutlineInputBorder(
                //         //     borderRadius: BorderRadius.all(Radius.circular(15)),
                //         //     borderSide: BorderSide(width: 1, color: Colors.black),
                //         //   ),
                //         //   disabledBorder: OutlineInputBorder(
                //         //     borderRadius: BorderRadius.all(Radius.circular(15)),
                //         //     borderSide: BorderSide(width: 1, color: Colors.black),
                //         //   ),
                //         //   enabledBorder: OutlineInputBorder(
                //         //     borderRadius: BorderRadius.all(Radius.circular(15)),
                //         //     borderSide: BorderSide(width: 1, color: Colors.black),
                //         //   ),
                //         //   border: OutlineInputBorder(
                //         //       borderRadius: BorderRadius.all(Radius.circular(15)),
                //         //       borderSide: BorderSide(
                //         //         width: 1,
                //         //       )),
                //         // ),
                //         // validator: (val) {
                //         //   if (val.length == 0) {
                //         //     return "Email cannot be empty";
                //         //   } else {
                //         //     return null;
                //         //   }
                //         // },
                //         // keyboardType: TextInputType.emailAddress,
                //         ),
                //   ],
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: TextFormField(
                        // controller: text,
                        // onChanged: viewModel.updateEmailForm,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          labelText: "UserName",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(222, 222, 222, 1),
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                        ),
                        // validator: (val) {
                        //   if (val.length == 0) {
                        //     return "Email cannot be empty";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        // keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: TextFormField(
                        // controller: text,
                        // onChanged: viewModel.updatePasswordForm,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.security,
                            color: Colors.black,
                          ),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Icons.visibility,
                              // viewModel.passwordVisible
                              //     ? Icons.visibility
                              //     :
                              Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                              // viewModel.toggleVisible();
                            },
                          ),
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(222, 222, 222, 1),
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                        ),
                        // obscureText: viewModel.passwordVisible,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: TextFormField(
                        // controller: text,
                        // onChanged: viewModel.updatePasswordForm,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.security,
                            color: Colors.black,
                          ),
                          labelText: "Conform Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Icons.visibility,
                              // viewModel.passwordVisible
                              //     ? Icons.visibility
                              //     :
                              Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                              // viewModel.toggleVisible();
                            },
                          ),
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(222, 222, 222, 1),
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                        ),
                        // obscureText: viewModel.passwordVisible,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    RaisedGradientButton(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                        ),
                      ),
                      onPressed: () {
                        model.loginGoogle();
                        print("Hello");
                      },
                      gradient: RadialGradient(
                        center: Alignment.centerLeft,
                        radius: 2,
                        colors: [
                          Color.fromRGBO(221, 36, 118, 1),
                          Color.fromRGBO(255, 81, 47, .8),
                          Color.fromRGBO(255, 174, 0, .8),
                          Color.fromRGBO(249, 232, 102, .8),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RaisedGradientButton(
                      child: Image.asset(
                        'assets/images/google.png',
                      ),
                      onPressed: () {
                        model.loginGoogle();
                        print("Hello");
                      },
                      gradient: RadialGradient(
                        center: Alignment.centerLeft,
                        radius: 2,
                        colors: [
                          Color.fromRGBO(221, 36, 118, 1),
                          Color.fromRGBO(255, 81, 47, .8),
                          Color.fromRGBO(255, 174, 0, .8),
                          Color.fromRGBO(249, 232, 102, .8),
                        ],
                      ),
                    ),
                    //TODO Ask subrat for better colors
                    RaisedGradientButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_add,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        model.loginGoogle();
                        print("Hello");
                      },
                      gradient: RadialGradient(
                        center: Alignment.centerLeft,
                        radius: 2,
                        colors: [
                          Color.fromRGBO(221, 36, 118, 1),
                          Color.fromRGBO(255, 81, 47, .8),
                          Color.fromRGBO(255, 174, 0, .8),
                          Color.fromRGBO(249, 232, 102, .8),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
