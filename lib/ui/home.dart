import 'package:mainbank/bank/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mainbank/bank/transaction.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mainbank/bank/transaction.dart';
import 'login.dart';


class Home extends StatelessWidget {
  Home({super.key});

final Box _boxLogin = Hive.box("login");
final Box _boxTransactionList = Hive.box("transactionList");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Center(
        
        child: Text(
          "Welcome 🎉",
           style: Theme.of(context).textTheme.bodyLarge,
        ),  
      ),
      appBar: AppBar(  
        title: const Text("Home Page"),  
        backgroundColor: Color.fromARGB(255, 243, 138, 33),
        actions: <Widget>[
          const SizedBox(width: 10,),  
          IconButton(icon: const Icon(Icons.exit_to_app_outlined), onPressed: () {
            _boxLogin.clear();
            _boxTransactionList.clear();
            _boxLogin.put("loginStatus", false);
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                 builder: (context) {
                      return const Login();
                    },
                  ),
                );
              },
            ), 
            IconButton(icon: const Icon(Icons.attach_money), onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                 builder: (context) {
                      return const Transaction();
                    },
                  ),
                );
              },
            ),
            IconButton(icon: const Icon(Icons.format_list_bulleted_outlined), onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                  builder: (context) {
                      return const TransactionList();
                    },
                  ),
                );
              },
            ), 
            const SizedBox(width: 30,),
          ],  
        ),       
      ),  
    ); 
  }
}




// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mainbank/bank/transaction.dart';

// import 'login.dart';

// class Home extends StatelessWidget {
//   Home({super.key});

// final Box _boxLogin = Hive.box("login");
// final Box _boxTransactionList= Hive.box("transactionList");


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login App"),
//         elevation: 0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.white),
//               ),
              // child: IconButton(
              //   onPressed: () {
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return  Transaction();
              //         },
              //       ),
              //     );
              //   },
              //   icon: const Icon(Icons.logout_rounded),
              // ),
//             ),
//           )
//         ],
//       ),
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Welcome 🎉",
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             const SizedBox(height: 10),
//             Text(
//               //'${_boxTransactionList.getAt(0)[0]}', 
//               '${_boxLogin.get("name")}',  
//               style: Theme.of(context).textTheme.headlineLarge,
//             ),
//             Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                       _boxLogin.put("loginStatus", false);
//                       Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                         return  Login();
//                       },
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.logout_rounded),
//               ),
//                   ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }