import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_frontend/models/profile_type_data.dart';

class ProfileCard extends StatelessWidget {
  ProfileTypeData profileTypeData;
  Function onTapFunction;

  ProfileCard({this.profileTypeData, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapFunction,
      child: Container(
        width: 170,
        height: 300,
        alignment: Alignment.center,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          color: this.profileTypeData.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset(
                    this.profileTypeData.assetFileDir,
                    semanticLabel: "Card",
                  )),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    this.profileTypeData.title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromRGBO(36, 59, 85, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      this.profileTypeData.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(23, 17, 3, 0.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
