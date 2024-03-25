// import 'package:flutter/material.dart';
//
// class Mech_Status_Reject extends StatefulWidget {
//   const Mech_Status_Reject({super.key});
//
//   @override
//   State<Mech_Status_Reject> createState() => _Mech_Status_RejectState();
// }
//
// class _Mech_Status_RejectState extends State<Mech_Status_Reject> {
//   int _value = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Container(
//                   height: 150,
//                   width: 320,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             radius: 40,
//                             backgroundImage:AssetImage("Assets/profile img.png"),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text("Name",style: TextStyle(fontSize: 20),),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Fuel Leaking",style: TextStyle(fontSize: 17),),
//                           Text("Date",style: TextStyle(fontSize: 17),),
//                           Text("Time",style: TextStyle(fontSize: 17),),
//                           Text("Place",style: TextStyle(fontSize: 17),),
//                         ],
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
//                   child: Text("Add status",style: TextStyle(fontSize: 25),),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Radio(
//                         value: 1,
//                         groupValue: _value,
//                         onChanged: (value){
//                           setState(() {
//                             _value = value!;
//                           });
//
//                         }
//                     ),
//                     Text("Completed",style: TextStyle(fontSize: 20),),
//
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Radio(
//                             value: 2,
//                             groupValue: _value,
//                             onChanged: (value){
//                               setState(() {
//                                 _value = value!;
//                               });
//
//                             }
//                         ),
//                         Text("Not Completed",style: TextStyle(fontSize: 20)),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }
