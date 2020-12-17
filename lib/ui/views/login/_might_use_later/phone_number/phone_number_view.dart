import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:printitflutterapp/ui/views/login/phone_number/phone_number_viewmodel.dart';
import 'package:printitflutterapp/ui/widgets/InputDecoration.dart';
import 'package:printitflutterapp/ui/widgets/raised_gradient_button.dart';
import 'package:stacked/stacked.dart';

class PhoneNumberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuilding it");
    return ViewModelBuilder<PhoneNumberViewModel>.reactive(
      // onModelReady: (model) async {
      //   model.modelInitFunction();
      // },
      builder: (context, model, child) => Center(
        child: model.isBusy
            ? Stack(
                children: [
                  viewBody(model),
                  loadingBarrer(),
                ],
              )
            : viewBody(model),
      ),
      viewModelBuilder: () => PhoneNumberViewModel(),
    );
  }

  Widget loadingBarrer() {
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(255, 255, 255, 0.4),
      child: CircularProgressIndicator(),
    );
  }

  Scaffold viewBody(PhoneNumberViewModel model) {
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: model.popBack,
                          icon: Icon(Icons.arrow_back_ios),
                          color: Color.fromRGBO(36, 59, 85, 1),
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(69, 89, 122, 1)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 35),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          backgroundColor: Colors.black,
                          useEmoji: true,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: TextStyle(color: Colors.black),
                        initialValue: model.number,
                        textFieldController: model.controller,
                        inputDecoration: TextInputDecoration(
                          hintText: "7355517759",
                        ),
                        // autoFocusSearch: ,
                        formatInput: true,
                        textStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
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
                onPressed: model.controller.text == null
                    ? null
                    : () {
                        print(
                            "Email: ${model.controller.text}, Password ${model.controller.text}");
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
