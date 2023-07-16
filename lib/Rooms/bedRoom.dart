// import 'dart:io';

// import 'package:besafe/business_logic/cubit/cubit_cubit.dart';
// import 'package:besafe/presentation/screens/mqtt/1.dart';
// import 'package:besafe/services/app_services.dart';
// // import 'package:bloc_provider/bloc_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:provider/provider.dart';
// import 'package:typed_data/src/typed_buffer.dart';

// import '../../../components/functions.dart';
// import '../mqtt/mqtt/MQTTManager.dart';
// import '../mqtt/mqtt/state/MQTTAppState.dart';

// class BedRoom extends StatefulWidget {
//   const BedRoom({Key? key}) : super(key: key);

//   @override
//   State<BedRoom> createState() => _BedRoomState();
// }

// class _BedRoomState extends State<BedRoom> {
//   // bool value1 = false;
//   // bool value2 = false;
//   // bool value3 = false;
//   // bool value4 = false;
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     backgroundColor: Colors.indigo.shade50,
//     body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Control Your Bed Room',
//           style: TextStyle(
//               fontWeight: FontWeight.w600, fontSize: 20, color: Colors.indigo
//             // fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Expanded(
//             child: ListView(
//               physics: const BouncingScrollPhysics(),
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       width: 155,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: const [
//                               Text(
//                                 'Light',
//                                 style:
//                                 TextStyle(fontSize: 20, color: Colors.grey),
//                               ),
//                               Icon(
//                                 Icons.light_mode,
//                                 color: Colors.yellow,
//                                 size: 35,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [

//                                 ]
//                               )
//                             ],
//                           ),

//                       ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(20),
//                       width: 155,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: const [
//                               Text(
//                                 'AC',
//                                 style:
//                                 TextStyle(fontSize: 20, color: Colors.grey),
//                               ),
//                               Icon(
//                                 Icons.ac_unit,
//                                 color: Colors.indigo,
//                                 size: 35,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               // ElevatedButton(
//                               //   onPressed: (){ OnCubit.get(context).on2();}
//                               // , child: child)
//                                                               Switch(
//                                 value: SwitchValues.value10,
//                                 onChanged: (val) {
//                                     setState(() {
//                                        SwitchValues.value10= val;
//                                   });

//                                 })
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(20),
//                       width: 155,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: const [
//                               Text(
//                                 'TV',
//                                 style:
//                                 TextStyle(fontSize: 20, color: Colors.grey),
//                               ),
//                               Icon(
//                                 Icons.tv_rounded,
//                                 color: Colors.indigo,
//                                 size: 35,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                                                                Switch(
//                                 value: SwitchValues.value11,
//                                 onChanged: (val) {
//                                     setState(() {
//                                        SwitchValues.value11 = val;
//                                   });

//                                 })
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(20),
//                       width: 155,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: const [
//                               Text(
//                                 'Door',
//                                 style:
//                                 TextStyle(fontSize: 20, color: Colors.grey),
//                               ),
//                               Icon(
//                                 Icons.sensor_door_outlined,
//                                 color: Colors.indigo,
//                                 size: 35,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                                                                Switch(
//                                 value: SwitchValues.value12,
//                                 onChanged: (val) {
//                                     setState(() {
//                                        SwitchValues.value12= val;
//                                   });

//                                 })
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             )),
//       ],
//     ),
//     );
//   }
// }
import 'dart:io' show Platform;
import 'package:besafe/presentation/screens/mqtt/mqtt/MQTTManager.dart';
import 'package:besafe/presentation/screens/mqtt/mqtt/state/MQTTAppState.dart';
import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BedRoom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BedRoomState();
  }
}

class _BedRoomState extends State<BedRoom> {


  bool ispressed = false;
  late MQTTAppState currentAppState;
  late MQTTManager manager;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MQTTAppState appState = Provider.of<MQTTAppState>(context);
    currentAppState = appState;
    return Scaffold(
        backgroundColor: Colors.indigo.shade50,
        body: SafeArea(child: buildColumn()));
  }

  Widget buildColumn() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20,),
        buildEditableColumn(),
      ],
    );
  }

  Widget buildEditableColumn() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Control Your Bed Room',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.indigo
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 60,
                    height: 60,
                    child: buildConnecteButton(
                        currentAppState.getAppConnectionState)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Center(
              child: Image.asset(
                'assets/images/smart-home.png',
                scale: 2.5,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevatedButton1with(currentAppState.getAppConnectionState),
              buildElevatedButton2with(currentAppState.getAppConnectionState),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevatedButton3with(currentAppState.getAppConnectionState),
              buildElevatedButton4with(currentAppState.getAppConnectionState),
            ],
          ),
        ],
      ),
    );
  }

  /* light button   */
  Widget buildElevatedButton1with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
      width: 155,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Light',
                style:
                TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.light_mode,
                color: Colors.yellow,
                size: 35,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    Toggle.passtoggle9 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value9 = !SwitchValues.value9;
                });
                setState(() {
                  Toggle.passtoggle9 = !Toggle.passtoggle9;
                });
                if (state == MQTTAppConnectionState.connected &&
                    SwitchValues.value9 == true)
                  publishMessage("D");
                else if (state == MQTTAppConnectionState.connected &&
                    SwitchValues.value9 == false)
                  publishMessage("E");
              } : null
              , child: Toggle.passtoggle9 ? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );
  }

  /* AC button   */
  Widget buildElevatedButton2with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
      width: 155,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'AC',
                style:
                TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.ac_unit,
                color: Colors.yellow,
                size: 35,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    Toggle.passtoggle10 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value10 = !SwitchValues.value10;
                });
                setState(() {
                  Toggle.passtoggle10 = !Toggle.passtoggle10;
                });
                if (state == MQTTAppConnectionState.connected &&
                    SwitchValues.value10 == true)
                  publishMessage("20");
                else if (state == MQTTAppConnectionState.connected &&
                    SwitchValues.value10 == false)
                  publishMessage("21");
              } : null
              ,
              child: Toggle.passtoggle10 ? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );
  }

  /* TV button   */
  Widget buildElevatedButton3with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
      width: 155,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'TV',
                style:
                TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.tv,
                color: Colors.yellow,
                size: 35,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    Toggle.passtoggle11 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value11 = !SwitchValues.value11;
                });
                setState(() {
                  Toggle.passtoggle11 = !Toggle.passtoggle11;
                });
                if (state == MQTTAppConnectionState.connected &&
                    SwitchValues.value11 == true)
                  publishMessage("22");
                else if (state == MQTTAppConnectionState.connected &&
                    SwitchValues.value11 == false)
                  publishMessage("23");
              } : null
              ,
              child: Toggle.passtoggle11 ? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );
  }

  /* Door button   */
  Widget buildElevatedButton4with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
      width: 155,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'DOOR',
                style:
                TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.door_sliding_outlined,
                color: Colors.yellow,
                size: 35,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    Toggle.passtoggle12 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value12 = !SwitchValues.value12;
                });
                setState(() {
                  Toggle.passtoggle12 = !Toggle.passtoggle12;
                });
                if (state == MQTTAppConnectionState.connected &&
                    SwitchValues.value12 == true)
                  publishMessage("B");
                else if (state == MQTTAppConnectionState.connected &&
                    SwitchValues.value12 == false)
                  publishMessage("C");
              } : null
              ,
              child: Toggle.passtoggle12 ? const Text("OPEND") : const Text(
                  "CLOSED")
          ),
        ],
      ),
    );
  }

  /*  build connection */
  Widget buildConnecteButton(MQTTAppConnectionState state) {
    return Row(
      children: <Widget>[
        Expanded(
          // ignore: deprecated_member_use
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff023859,
                  ),
                  fixedSize: const Size(40, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              child: Icon(Icons.power_settings_new,
                  color: ispressed ? Colors.purple : Colors.white),
              onPressed: state == MQTTAppConnectionState.disconnected
                  ? () {
                setState(() {
                  ispressed = !ispressed;
                });
                configureAndConnect();
              } : () {
                setState(() {
                  ispressed = !ispressed;
                });
                disconnect();
              }

          ),
        ),

      ],
    );
  }

  void configureAndConnect() {
    // ignore: flutter_style_todos
    // TODO: Use UUID
    String  osPrefix = 'ALI_EL';

    if (Platform.isAndroid) {
      osPrefix = 'hassan_yomna';
    }
    manager = MQTTManager(
        host: "mqtt-dashboard.com",
        topic: "hassan_yomna",
        identifier: osPrefix,
        state: currentAppState);
    manager.initializeMQTTClient();
    manager.connect();
  }

  void disconnect() {
    manager.disconnect();
  }

  /* publish message */
  void publishMessage(String text) {
    String osPrefix = 'ALI_EL';

    if (Platform.isAndroid) {
      osPrefix = 'hassan_yomna';
    }
    final String message = text;
    manager.publish(message);
  }

}
