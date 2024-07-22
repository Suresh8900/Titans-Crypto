import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../values/ColorValues.dart';
import 'Constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HexColor.dart';

TextButton btnWithBorder(String buttonName, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: Colors.tealAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide.none,
        )),
    child: Container(
      height: 32,
      width: toolsHelper.getFullWidth(),
      child: Text(
        buttonName.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      ),
    ),
  );
}
TextButton btnWithBorder2(String buttonName, VoidCallback onPressed) {
  return TextButton(

    onPressed: onPressed,
    style: TextButton.styleFrom(

        alignment: Alignment.center,
        backgroundColor: HexColor(color5ED5A8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide.none,
        )),
    child: Container(
      height: 30,
      alignment: Alignment.center,
      width: 100,

      child: Text(
        buttonName,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
      ),
    ),
  );
}
TextButton btnWithBorderAndColor(String buttonName, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
        alignment: Alignment.center,
        textStyle: TextStyle(
            fontWeight: FontWeight.w900, color: Colors.white, fontSize: 15),
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(width: 1, color: Colors.deepOrange),
        )),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
      child: Text(
        textAlign: TextAlign.center,
        buttonName,
        style: const TextStyle(
            fontWeight: FontWeight.w900, color: Colors.white, fontSize: 15),
      ),
    ),
  );
}

Container btnWithBorderAndIcon2(
    String buttonName, String image, VoidCallback onPressed) {
  return Container(
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(width: 0.5, color: Colors.grey),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 15,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              child: Text(
                buttonName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Container btnWithBorderAndIcon(String buttonName,String ind,VoidCallback onPressed){
return Container(
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(width: 0.5, color: Colors.white),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook,
              color: Colors.blueAccent,
            ),
            // Image.asset(
            //   ind,
            //   height: 15,
            // ),
            Expanded(
              child: Text(
                buttonName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

GestureDetector blueButtonFull(String buttonName, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 55,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: HexColor(appThemeColor)),
      child: Text(
        buttonName,
        style: textStyle16(Colors.white),
      ),
    ),
  );
}

GestureDetector whiteButtonFull(String buttonName, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 55,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Colors.transparent,
          border: Border.all(color: HexColor(E5E7EB), width: 1)),
      child: Text(
        buttonName,
        style: textStyle16(HexColor(color_6B7280)),
      ),
    ),
  );
}

TextStyle textStyle16(Color textColor) {
  return TextStyle(
      fontWeight: FontWeight.w900,
      color: textColor,
      fontSize: toolsHelper.getTextSize(16),
      decoration: TextDecoration.none);
}

TextStyle textStyle32(Color textColor) {
  return TextStyle(
    fontWeight: FontWeight.w900,
    color: textColor,
    fontSize: toolsHelper.getTextSize(50),
    decoration: TextDecoration.none,
  );
}

TextStyle textStyle(
    {FontWeight fontWeight = FontWeight.w500,
    Color textColor = Colors.black,
    double textSize = 12}) {
  return TextStyle(
      fontWeight: fontWeight,
      color: textColor,
      fontSize: toolsHelper.getTextSize(12));
}

TextStyle textStyle24({
  FontWeight fontWeight = FontWeight.w700,
  Color textColor = Colors.white,
}) {
  return TextStyle(
      fontWeight: fontWeight,
      color: textColor,
      fontSize: toolsHelper.getTextSize(22));
}

TextStyle textStyle22(
    {FontWeight fontWeight = FontWeight.w700,
    Color textColor = Colors.white,
    TextAlign textAlign = TextAlign.start}) {
  return TextStyle(
      fontWeight: fontWeight,
      color: textColor,
      fontSize: toolsHelper.getTextSize(28));
}

TextStyle textStyle30({
  FontWeight fontWeight = FontWeight.w900,
  Color textColor = Colors.white,
}) {
  return TextStyle(
      fontWeight: fontWeight,
      color: textColor,
      fontSize: toolsHelper.getTextSize(40));
}

TextSpan writeTextSpan(
    String textSpan, double textSize, Color color, FontWeight fontWeight,
    {required List<TextSpan> children}) {
  return TextSpan(
      text: textSpan,
      style:
          TextStyle(fontSize: textSize, fontWeight: fontWeight, color: color));
}

// GestureDetector backButton(VoidCallback onPressed) {
//   return GestureDetector(
//     onTap: onPressed,
//     child: SizedBox(
//       height: 40,
//       width: 40,
//       child: SvgPicture.asset("assets/icons/ic_arrow_left.svg"),
//     ),
//   );
// }

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.black45,
      backgroundColor: Colors.white,
      fontSize: 16.0);
}

Container mobileEditText(TextEditingController textEditingController) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      color: HexColor(color161C22),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: textEditingController,
        style: TextStyle(color: Colors.white),
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.digitsOnly
        // ],
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your email',
          hintStyle: TextStyle(color:Colors.white),
          counterText: ''
        ),
      ),
    ),
  );
}

bool isKeyboardVisible(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.viewInsets.bottom > 0;
}

Center passwordEditText(bool showPassword, VoidCallback onEyePressed,
    TextEditingController textEditingController) {

   bool showPassword=false;
  return Center(
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: HexColor(color161C22),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: TextField(
              textAlign: TextAlign.start,
              keyboardType: TextInputType.visiblePassword,
              controller: textEditingController,
              obscureText: showPassword,
              obscuringCharacter: "*",
              style: TextStyle(color:Colors.white),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(

                      Icons.remove_red_eye_outlined,
                      color: HexColor(color_6B7280),
                    ),
                    onPressed: () {
                      // showPassword=!showPassword;
                      onEyePressed();
                    },
                  ),
                  counterText: '',
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color:Colors.white),
                  border: InputBorder.none
              )
            ),
          ),
        ),
      ),
    ),
  );
}

OutlineInputBorder inputBorder(
    double radius, double borderWidth, Color borderColor) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(width: borderWidth, color: borderColor));
}

Container commonEditText(TextInputType textInputType, String hint,
    TextEditingController textEditingController, int currentIndex) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    width: double.infinity,
    height: 60,
    child: TextField(
        keyboardType: textInputType,
        controller: textEditingController,
        maxLength: currentIndex == 0 ? 16 : 12,
        style: textStyle16(HexColor(color_1F2937)),
        decoration: InputDecoration(
          //counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.deepOrange),
          ),
          labelText: hint,
          //  errorText: "Please enter in field",
          //   errorBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: checkValidation==true? Colors.green : Colors.red,width: 1),
          //   ),
          counterText: '',
          floatingLabelBehavior: FloatingLabelBehavior.never,
        )),
  );
}

SizedBox topMargin(double margin) {
  return SizedBox(
    height: margin,
  );
}

SizedBox leftMargin(double margin) {
  return SizedBox(
    width: margin,
  );
}

SizedBox rightMargin(double margin) {
  return SizedBox(
    width: margin,
  );
}

double getHeight(double sysVar, double size) {
  double calc = size / 1000;
  return sysVar * calc;
}

double getTextSize(double sysVar, double size) {
  double calc = size / 10;
  return sysVar * calc;
}

Future<DateTime> showDatePickerDialog(BuildContext context) async {
  DateTime? showDatePickerDialog = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2023, 9, 15));
  if (showDatePickerDialog != null) {
    return showDatePickerDialog;
  }
  return DateTime.now();
}

Column headerWithBackBtn2(VoidCallback callback1, bool backBtn) {
  return Column(
    children: [
      InkWell(
        onTap: callback1,
        child: Material(
          color: Colors.white,
          child: Container(
            width: double.infinity,
            height: 80,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                        visible: backBtn,
                        child: SvgPicture.asset("assets/icons/ic_back_btn.svg",
                            width: 20, height: 20)),
                    Image.asset(
                      "assets/icons/ic_logo_hori.png",
                      width: 90,
                      height: 90,
                    ),
                  ]),
            ),
          ),
        ),
      )
    ],
  );
}

InkWell headerWithBackBtn(VoidCallback callback1, bool backBtn) {
  return InkWell(
    onTap: callback1,
    child: Material(
      elevation: 1,
      color: Colors.grey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 70,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Visibility(
                visible: backBtn,
                child: SvgPicture.asset("assets/icons/ic_back_btn.svg",
                    width: 20, height: 20)),
            Image.asset(
              "assets/icons/ic_logo_hori.png",
              width: 90,
              height: 90,
            ),
          ]),
        ),
      ),
    ),
  );
}

Container assessmentCell(VoidCallback voidCallback, String title,
    [String? assignTitle]) {
  return Container(
    child: InkWell(
      //onTap: voidCallback,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Card(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          elevation: 1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 20.0, bottom: 0, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: textStyle(
                          fontWeight: FontWeight.w700,
                          textColor: Colors.black,
                          textSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        "5 Questions",
                        style: textStyle(
                                fontWeight: FontWeight.w300,
                                textColor: Colors.grey,
                                textSize: 12)
                            .copyWith(decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          "26-Jul-2023 To 31-Mar-2024",
                          textAlign: TextAlign.start,
                          style: textStyle(
                                  fontWeight: FontWeight.w300,
                                  textColor: Colors.grey,
                                  textSize: 12)
                              .copyWith(decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: btnWithBorderAndIcon2(
                          "Start", "assets/icons/ic_start.png", voidCallback),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Container whiteContainer(VoidCallback voidCallback, String icons, String title,
    [String? assignTitle]) {
  return Container(
    child: Container(
      child: Container(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          width: double.infinity,
          child: InkWell(
            onTap: voidCallback,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black12)],
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: HexColor(colorE3E6FF),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    width: 60,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        icons,
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 0.0, bottom: 0, top: 15),
                      child: Container(
                        child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: title + "\n",
                                  style: textStyle16(HexColor(appThemeColor1))),
                              const WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.0, bottom: 0),
                                ),
                              ),
                              TextSpan(
                                  text: assignTitle,
                                  // recognizer: TapGestureRecognizer()
                                  //   ..onTap = voidCallback,
                                  style: textStyle(
                                          fontWeight: FontWeight.w300,
                                          textColor: HexColor(appThemeColor1),
                                          textSize: 14)
                                      .copyWith(
                                          decoration: TextDecoration.none))
                            ])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Container questionCell(bool isSelected, String title, String options) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            width: isSelected ? 2 : 1,
            color: isSelected ? Colors.blue : Colors.grey),
        shape: BoxShape.rectangle),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            options,
            style: textStyle24(),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Text(
            title,
            style: textStyle16(Colors.black),
          ),
        )),
        isSelected
            ? Container(
                margin: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/icons/ic_selected.png",
                  width: 20,
                  height: 20,
                ))
            : Container(),
      ],
    ),
  );
}

Container bottomBtnsCell() {
  return Container(
    child: ClipRRect(
      child: Container(
          height: 100,
          margin: EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 0.0), //(x,y)
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: btnWithBorder("Previous", () {}))),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: btnWithBorder("Next", () {}))),
            ],
          )),
    ),
  );
}

GestureDetector termsConditionTextView(VoidCallback callback1) {
  return GestureDetector(
    onTap: callback1,
    child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          // TextSpan(
          //     text: "By tapping Log in, you agree to our ",
          //     style: textStyle(
          //         fontWeight: FontWeight.w400,
          //         textColor: HexColor(color_6B7280),
          //         textSize: 16)),

          // TextSpan(
          //     text: "Terms and Conditions\n",
          //     recognizer: TapGestureRecognizer()..onTap = callback1,
          //     style: textStyle(
          //             fontWeight: FontWeight.w400,
          //             textColor: HexColor(color_6B7280),
          //             textSize: 14)),
          const WidgetSpan(
              child: Padding(
            padding: EdgeInsets.only(top: 13), // Adjust the value as needed
          )),
          TextSpan(
            text: "Terms & Conditions",
            recognizer: TapGestureRecognizer()..onTap = callback1,
            style: const TextStyle(
              shadows: [Shadow(color: Colors.black, offset: Offset(0, -3))],
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationColor: Colors.grey,
              decorationThickness: 2,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),

          // TextSpan(
          //     text: " and ",
          //     style: textStyle(
          //         fontWeight: FontWeight.w400,
          //         textColor: HexColor(color_6B7280),
          //         textSize: 16)),
          // TextSpan(
          //     text: "Privacy Policy",
          //     recognizer: TapGestureRecognizer()..onTap = callback2,
          //     style: textStyle(
          //             fontWeight: FontWeight.w600,
          //             textColor: HexColor(color_6B7280),
          //             textSize: 16)
          //         .copyWith(decoration: TextDecoration.underline)),
        ])),
  );
}



Future openSettingDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
          ),
          child: AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Permission required',
              style: textStyle24(),
            ),
            content: Text(
                'Permission required to access files. Would you like to open app settings to allow permission?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showToast("Permission denied");
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings(); // Open app settings
                },
                child: Text('Open Settings'),
              ),
            ],
          ));
    },
  );
}
Future showCommonDeleteAlertDialog(BuildContext context,String title,VoidCallback positiveBtn) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          // Actual dialog
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            child: AlertDialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              content: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0, top: 0),
                        child: Container(
                            child: Text(title,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: btnWithBorder2("Yes",positiveBtn)),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                                child: btnWithBorder2("No",(){
                                  Navigator.pop(context);
                                })),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              actions: [],
            ),
          ),
        ],
      );
    },
  );
}

