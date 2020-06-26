// TODO Implement this library.

bool register=false;
bool isLoggedIn = false;
String typo;
List<int> valores = [0, 0, 0, 0, 0, 0, 0, 0];
List<int> salida = [0, 0, 0, 0, 0, 0, 0, 0];
List<int> pos=[1,2,3,4,5,6,7,8];
List<String> nomInte=['Linguistica','Matematica','Espacial','Corporal','Naturalista','Musical','Interpersonal','Intrapersonal'];
List<String> description= ['Esta inteligencia está relacionada con el lenguaje y la comunicación y en la cual se integran los dos hemisferios cerebrales, siendo un ejemplo de ella su forma más completa por los poetas, escritores y buenos redactores, utilizando en ella los dos hemisferios.','Está relacionada con la capacidad lógica y matemática, así como la capacidad científica','Es la capacidad para formarse un modelo mental de un mundo espacial y para maniobrar y operar usando este modelo tridimensional','Es la capacidad para utilizar el cuerpo para resolver problemas o para elaborar productos','La que utilizamos cuando observamos y estudiamos la naturaleza.','La capacidad para desenvolverse en el ámbito de la música','Es la capacidad para entender a otras personas, qué es lo que les motiva, cómo trabajan, cómo trabajar con ellos en forma cooperativa y colaborativa.','Es la capacidad de formarse un modelo verídico, de uno mismo y de utilizarlo para desenvolverse eficazmente en la vida.' ];

Map<int,String> mapV= Map.fromIterables(pos, nomInte);

Map sortmap(Map map){
  var sortMap = Map.fromEntries(map.entries.toList()..sort((e1,e2) => e1.value.toString().compareTo(e2.value.toString())));
return sortMap;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}