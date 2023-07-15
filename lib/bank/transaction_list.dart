import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mainbank/bank/transaction.dart';
import 'package:mainbank/ui/home.dart';


final Box _boxTransactionList= Hive.box("transactionList");

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: const Text("list of your transaction"),
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
        body: ListView(
        children: <Widget>[
          // Container(
          //   height: 40,
          //   color: Colors.deepOrange,
          //   child: const Center(
          //     child: Text(
          //       'Transaction List',
          //       style: TextStyle(color: Colors.white, fontSize: 16),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 10),
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: _boxTransactionList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //const SizedBox(height: 2,),
                height: 60,
                color: Colors.lime,
                child: 
                  Row(
                    children:  [
                      const SizedBox(height: 2,),
                      Text (
                        _boxTransactionList.getAt(index)[0].toString(),
                      ),
                      const SizedBox(width: 30,),
                      Text (
                        _boxTransactionList.getAt(index)[1].toString(),
                        
                      ),
                      // Text(
                      //   decoration: InputDecoration(
                      //       filled: true,
                      //       fillColor: Colors.grey,
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(50),
                      //     ),
                      //   ),
                      // )
                    ],
                ),
              );
            },
          ),
        ],
      ),
    ); 
  }
}

// Center(child: 
//         Row(
//           children:  [
//             TextField(
//               decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey,
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//               ),
//             )
//           ],
//       ),) 