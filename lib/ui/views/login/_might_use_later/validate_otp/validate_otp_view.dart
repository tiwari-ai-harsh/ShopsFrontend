import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:printitflutterapp/ui/views/login/validate_otp/validate_otp_viewmodel.dart';
import 'package:printitflutterapp/ui/widgets/raised_gradient_button.dart';
import 'package:stacked/stacked.dart';

class ValidateOTPView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuilding it");
    return ViewModelBuilder<ValidateOTPModel>.reactive(
      builder: (context, model, child) => Center(
        child: model.isBusy
            ? Stack(
                children: [
                  viewBody(model, context),
                  loadingBarrer(),
                ],
              )
            : viewBody(model, context),
      ),
      viewModelBuilder: () => ValidateOTPModel(),
    );
  }

  Widget loadingBarrer() {
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(255, 255, 255, 0.4),
      child: CircularProgressIndicator(),
    );
  }

  Scaffold viewBody(ValidateOTPModel model, BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
        child: Stack(
          alignment: Alignment.topCenter,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            // SizedBox(height: 30),
            // Container(
            //   height: MediaQuery.of(context).size.height / 3,
            //   child: FlareActor(
            //     "assets/otp.flr",
            //     animation: "otp",
            //     fit: BoxFit.fitHeight,
            //     alignment: Alignment.center,
            //   ),
            // ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: model.phoneNumber,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style: TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                //TODO okay till here. But need to get the phoneNumber.
                Form(
                  key: model.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 30,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 60,
                        fieldWidth: 50,
                        inactiveColor: Colors.grey,
                        activeColor:
                            !model.hasError ? Colors.orangeAccent : Colors.red,
                        selectedColor: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      textStyle: TextStyle(fontSize: 20, height: 1.6),
                      backgroundColor: Colors.transparent,
                      errorAnimationController: model.streamController,
                      controller: model.controller,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (value) => {model.login()},
                      // (v) {
                      // print("Completed");
                      // },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: model.onChangedCurrentValue,
                      // (value) {
                      // print(value);
                      // setState(() {
                      //   currentText = value;
                      // });
                      // },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    model.hasError
                        ? "*Please fill up all the cells properly"
                        : "",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                    children: [
                      TextSpan(
                        text: " RESEND",
                        // recognizer: model.onTapRecognizer,
                        style: TextStyle(
                          color: Color(0xFF91D3B3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                // Container(
                //   margin: const EdgeInsets.symmetric(
                //       vertical: 16.0, horizontal: 30),
                //   child: ButtonTheme(
                //     height: 50,
                //     child: FlatButton(
                //       onPressed: () {
                //         model.formKey.currentState.validate();
                //         // conditions for validating
                //         // if (currentText.length != 6 ||
                //         //     currentText != "towtow") {
                //         //   errorController.add(ErrorAnimationType
                //         //       .shake); // Triggering error shake animation
                //         //   setState(() {
                //         //     hasError = true;
                //         //   });
                //         // } else {
                //         //   setState(
                //         //     () {
                //         //       hasError = false;
                //         //       scaffoldKey.currentState.showSnackBar(
                //         //         SnackBar(
                //         //           content: Text("Aye!!"),
                //         //           duration: Duration(seconds: 2),
                //         //         ),
                //         //       );
                //         //     },
                //         //   );
                //         // }
                //       },
                //       child: Center(
                //           child: Text(
                //         "VERIFY".toUpperCase(),
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold),
                //       )),
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //       color: Colors.green.shade300,
                //       borderRadius: BorderRadius.circular(5),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.green.shade200,
                //             offset: Offset(1, -2),
                //             blurRadius: 5),
                //         BoxShadow(
                //             color: Colors.green.shade200,
                //             offset: Offset(-1, 2),
                //             blurRadius: 5)
                //       ]),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     FlatButton(
                //       child: Text("Clear"),
                //       onPressed: () {
                //         model.controller.clear();
                //       },
                //     ),
                //     FlatButton(
                //       child: Text("Set Text"),
                //       onPressed: () {
                //         model.controller.text = "123456";
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedGradientButton(
                child: Text(
                  "Go",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0),
                ),
                gradient: model.controller.text == null
                    ? LinearGradient(
                        colors: [
                          Color.fromRGBO(124, 124, 124, 0.5),
                          Color.fromRGBO(0, 0, 0, 1)
                        ],
                      )
                    : LinearGradient(
                        colors: [
                          Color.fromRGBO(254, 180, 123, 1),
                          Color.fromRGBO(255, 126, 95, 1)
                        ],
                      ),
                onPressed: model.controller.text == ""
                    ? null
                    : () {
                        print("${model.controller.text}");
                        // print(
                        //     "Email: ${model.controller.text}, Password ${model.controller.text}");
                        model.login();
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
