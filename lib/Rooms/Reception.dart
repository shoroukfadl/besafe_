import 'dart:io' show Platform;
import 'package:besafe/presentation/screens/mqtt/mqtt/MQTTManager.dart';
import 'package:besafe/presentation/screens/mqtt/mqtt/state/MQTTAppState.dart';
import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Reception extends StatefulWidget {
  @override
  State<StatefulWidget> createState(

      ) {
    return _ReceptionState();
  }
}

class _ReceptionState extends State<Reception> {
  // bool passtoggle5 = false;
  // bool passtoggle6 = false;
  // bool passtoggle7 = false;
  // bool passtoggle8 = false;

  bool ispressed =false;
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
    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  'Control Your Reception',
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
                    child: buildConnecteButton(currentAppState.getAppConnectionState)),
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
      padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
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
                  backgroundColor: Color( Toggle.passtoggle5 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value5 = !SwitchValues.value5;
                });
                setState(() {
                  Toggle.passtoggle5 = !Toggle.passtoggle5;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value5 ==true)
                  publishMessage("L");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value5 == false)
                  publishMessage("M");
              } : null
              , child: Toggle.passtoggle5? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );

  }
  /* AC button   */
  Widget buildElevatedButton2with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
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
                  backgroundColor: Color( Toggle.passtoggle6 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value6 = !SwitchValues.value6;
                });
                setState(() {
                  Toggle.passtoggle6 = !Toggle.passtoggle6;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value6 ==true)
                  publishMessage("P");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value6 == false)
                  publishMessage("Q");
              } : null
              , child: Toggle.passtoggle6? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );
  }

  /* TV button   */
  Widget buildElevatedButton3with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
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
                  backgroundColor: Color( Toggle.passtoggle7 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value7 = !SwitchValues.value7;
                });
                setState(() {
                  Toggle.passtoggle7  = !Toggle.passtoggle7 ;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value7 ==true)
                  publishMessage("14");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value7 == false)
                  publishMessage("15");
              } : null
              , child: Toggle.passtoggle7? const Text("ON") : const Text("OFF")
          ),
        ],
      ),
    );
  }

  /* Door button   */
  Widget buildElevatedButton4with(MQTTAppConnectionState state) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
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
                  backgroundColor: Color( Toggle.passtoggle8 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value8 = !SwitchValues.value8;
                });
                setState(() {
                  Toggle.passtoggle8 = !Toggle.passtoggle8;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value8 ==true)
                  publishMessage("K");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value8 == false)
                  publishMessage("J");
              } : null
              , child: Toggle.passtoggle8? const Text("OPEND") : const Text("CLOSED")
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
                  backgroundColor: Color( 0xff023859,
                  ),
                  fixedSize: const Size(40, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              child: Icon(Icons.power_settings_new , color : ispressed ? Colors.purple:  Colors.white),
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
