
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'main_app.dart';

void main() async {
  await _initHive();
  runApp(const MainApp());
}

// @HiveType(typeId: 0)
// class User {
//   @HiveField(0)
//    int? id ;

//    @HiveField(1)
//    String? userName;
   
//    @HiveField(2)
//    String? password;

// }

// @HiveType(typeId: 0)
// class TransactionList {
//   @HiveField(0)
//    int? id;

//    @HiveField(1)
//    int? lastTransactionId; 

//    @HiveField(2)
//    Text? worth;

//    @HiveField(3)
//    Text? receiver;

//    @HiveField(4)
//    Text? sender;

//    @HiveField(5)
//    Text? transaction;

//   TransactionList () {
//       worth = "1000" as Text;
//   }

// }

Future<void> _initHive() async{

  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("transactionList");
  await Hive.openBox("accounts");
}
