import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:queestudiar/question.dart';


class QuizBrain{
/*  StreamBuilder<QuerySnapshot>(stream: Firestore.instance.collection('PreguntaID').snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
  if(!snapshot.hasData) return value = ('Loading data.. Please wait');
  return snapshot.data.documents.map((DocumentSnapshot document){
  return value = document['descripcion'];
  default:
    return value = 'Loading';
    };
  });
*/
 List<Question> questionBank = [
    Question('Los libros son muy importantes para mí.', 1,'inteligencia01'),
    Question('Puedo calcular mentalmente números con facilidad.', 2,'inteligencia01'),
    Question('A menudo veo imágenes claras cuando cierro mis ojos.',3,'inteligencia01'),
    Question('Me dedico por lo menos a un deporte o actividad física de forma regular.', 4,'inteligencia01'),
    Question('Me gusta todo tipo de animales', 5,'inteligencia01'),
    Question('Tengo una voz agradable para cantar.', 6,'inteligencia01'),
  ];
}

 