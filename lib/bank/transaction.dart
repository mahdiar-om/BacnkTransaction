import 'dart:ffi';
import 'dart:math';

  import 'package:flutter/material.dart';
  import 'package:flutter/src/widgets/framework.dart';
  import 'package:flutter/src/widgets/placeholder.dart';
  import 'package:hive_flutter/hive_flutter.dart';

  import '../ui/home.dart';

  final Box _boxLogin = Hive.box("login");
  final Box _boxTransactionList= Hive.box("transactionList");
  final TextEditingController _controllerCash = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();

  

  class Transaction extends StatefulWidget {
    const Transaction({
    Key? key,
  }) : super(key: key);

    @override
    State<Transaction> createState() => _TransactionState();
  }

  class _TransactionState extends State<Transaction> {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final int _money = (_boxLogin.get("cash"));

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        drawerEnableOpenDragGesture: false, 
        appBar: AppBar(
          actions: [
            IconButton(icon: const Icon(Icons.exit_to_app_outlined), onPressed: () {
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                 builder: (context) {
                      return Home();
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 30,),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Form(
          
          key: _formKey,
          child: SingleChildScrollView(
            
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(height: 160),
              Text(
                'Balance: $_money',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 60),
                TextFormField(
                  controller: _controllerUsername,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                    
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerCash,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "The amount of transaction",
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),          
                  validator: (String? value) {
                    if(value == null || num.parse(value)  < 0) {
                        return "Enter validate number";
                    } return null;
                  },
                ),
                const SizedBox(height: 60),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        
                        if(_formKey.currentState?.validate() ?? false) {
                          _boxTransactionList.add([_controllerUsername.text , _controllerCash.text]);
                          _boxLogin.put("cash" ,  max(_money - num.parse(_controllerCash.text) , 0) );
                          _controllerCash.clear();    
                          _controllerUsername.clear();          
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },  
                            ),
                          );
                        }
                      },
                      child: const Text("Pay"),
                    ),  
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    //_focusNodePassword.dispose();
    _controllerUsername.dispose();
    _controllerCash.dispose();
  }