import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_frontend/models/profile_type_data.dart';
import 'package:shop_frontend/ui/views/startup/profile_type_viewmodel.dart';
import 'package:shop_frontend/ui/widgets/profile_card.dart';
import 'package:stacked/stacked.dart';

class ProfileTypeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Container(
          child: Container(
            decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.darken,
                gradient: LinearGradient(
                    colors: [Colors.amber, Colors.white, Colors.amber],
                    begin: Alignment(-3.0, -3.0),
                    end: Alignment(3.0, 3.0))),
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
                    Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromRGBO(36, 59, 85, 1),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      "Profile Type",
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(69, 89, 122, 1)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 38,
                    ),
                    Text(
                      "Select your profile type as per your need .",
                      style: TextStyle(
                          color: Color.fromRGBO(69, 89, 122, 1),
                          fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileCard(
                      profileTypeData: ProfileTypeData(
                        color: Color.fromRGBO(255, 209, 107, 1),
                        assetFileDir: "assets/images/Group.png",
                        title: "Cyber Cafe",
                        description: "Give’s time and print fast by “PrintIt”.",
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        ProfileCard(
                          onTapFunction: model.navigateToLogin,
                          profileTypeData: ProfileTypeData(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            assetFileDir: "assets/images/man.png",
                            title: "User",
                            description:
                                "Save time and print fast by “PrintIt”.",
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
