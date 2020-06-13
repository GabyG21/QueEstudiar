// TODO Implement this library.

bool register=false;
bool isLoggedIn = false;
List<int> valores = [0, 0, 0, 0, 0, 0, 0, 0];
List<int> salida = [0, 0, 0, 0, 0, 0, 0, 0];
List<int> pos=[1,2,3,4,5,6,7,8];

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}