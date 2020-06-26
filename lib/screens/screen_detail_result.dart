import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chart_result.dart';

class DetailResultPage extends StatefulWidget {
  @override
  _DetailResultPageState createState() => _DetailResultPageState();
}

class _DetailResultPageState extends State<DetailResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inteligencia Detalle'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: ResultChart(),),
    );
  }
}
