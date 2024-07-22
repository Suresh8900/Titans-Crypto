
bool checkMobileValidation(String mobileNo){
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (mobileNo.isEmpty) {
    return false;
  }
  else if (!regExp.hasMatch(mobileNo)) {
    return false;
  }
  return true;

}

bool checkEmailValidation(String em) {
  if(em.isNotEmpty) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }
  return false;
}


bool checkPasswordValidation(String value){
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  }
  else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;

}


