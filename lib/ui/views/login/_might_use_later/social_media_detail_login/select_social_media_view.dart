import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:printitflutterapp/ui/views/login/social_media_detail_login/select_social_media_view_model.dart';
import 'package:stacked/stacked.dart';

class SocialMediaDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuilding it");
    return ViewModelBuilder<SocialMediaDetailModel>.reactive(
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
      viewModelBuilder: () => SocialMediaDetailModel(),
    );
  }

  Widget loadingBarrer() {
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(255, 255, 255, 0.4),
      child: CircularProgressIndicator(),
    );
  }

  Scaffold viewBody(SocialMediaDetailModel model) {
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
                          "Select Social Media Account",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(69, 89, 122, 1),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 35,
                      ),
                      child: Form(
                        key: model.formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: "First Name"),
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText: "Last Name"),
                                ),
                              ],
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: "Email Address"),
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: "Phone Number"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
