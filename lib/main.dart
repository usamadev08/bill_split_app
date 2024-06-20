import 'package:bill_split_app/model/bill_split_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/bill_split_home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BillSplitModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bill Split App',
      home: BillSplitHome(),
    );
  }
}
