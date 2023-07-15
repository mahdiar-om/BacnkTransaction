// ignore_for_file: unused_field

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

//import 'package:mainbank/ui/login.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final Box _boxLogin = Hive.box("login");

  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}