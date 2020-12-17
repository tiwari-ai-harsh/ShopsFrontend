import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

class TextInputDecoration extends InputDecoration {
  TextInputDecoration({String labelText, String hintText})
      : super(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(
            color: Color.fromRGBO(222, 222, 222, 1),
            fontWeight: FontWeight.w200,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
        ) {}
}
//   InputDecoration(
//                             labelText: "Username OR Email",
//                             labelStyle: TextStyle(
//                               color: Color.fromRGBO(222, 222, 222, 1),
//                               fontWeight: FontWeight.w900,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: BorderSide(
//                                 width: 2,
//                                 color: model.errorLogin == true
//                                     ? Colors.red
//                                     : Colors.black,
//                               ),
//                             ),
//                             disabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(15)),
//                               borderSide: BorderSide(
//                                   width: 2,
//                                   color: model.errorLogin == true
//                                       ? Colors.red
//                                       : Colors.black),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(15)),
//                               borderSide: BorderSide(
//                                   width: 2,
//                                   color: model.errorLogin == true
//                                       ? Colors.red
//                                       : Colors.black),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: BorderSide(
//                                 width: 2,
//                                 color: model.errorLogin == true
//                                     ? Colors.red
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
// }
