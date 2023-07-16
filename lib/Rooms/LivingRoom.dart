import 'dart:io' show Platform;
import 'package:besafe/presentation/screens/mqtt/mqtt/MQTTManager.dart';
import 'package:besafe/presentation/screens/mqtt/mqtt/state/MQTTAppState.dart';
import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Living extends StatefulWidget {
  @override
  State<StatefulWidget> createState(

      ) {
    return LivingState();
  }
}

class LivingState extends State<Living> {


  //bool ispressed =false;
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
                  'Control Your Living Room',
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
                  backgroundColor: Color( Toggle.passtoggle1 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value1 = !SwitchValues.value1;
                });
                setState(() {
                  Toggle.passtoggle1 = !Toggle.passtoggle1;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value1 ==true)
                  publishMessage("2");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value1 == false)
                  publishMessage("3");
              } : null
              , child: Toggle.passtoggle1? const Text("ON") : const Text("OFF")
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
                  backgroundColor: Color( Toggle.passtoggle2 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value2 = !SwitchValues.value2;
                });
                setState(() {
                  Toggle.passtoggle2 = !Toggle.passtoggle2;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value2 ==true)
                  publishMessage("4");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value2 == false)
                  publishMessage("5");
              } : null
              , child: Toggle.passtoggle2? const Text("ON") : const Text("OFF")
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
                  backgroundColor: Color( Toggle.passtoggle3 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value3 = !SwitchValues.value3;
                });
                setState(() {
                  Toggle.passtoggle3 = !Toggle.passtoggle3;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value3 ==true)
                  publishMessage("6");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value3 == false)
                  publishMessage("7");
              } : null
              , child: Toggle.passtoggle3? const Text("ON") : const Text("OFF")
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
                  backgroundColor: Color( Toggle.passtoggle4 ? 0xffdaa520 : 0xff023859,
                  ),
                  fixedSize: const Size(140, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value4 = !SwitchValues.value4;
                });
                setState(() {
                  Toggle.passtoggle4 = !Toggle.passtoggle4;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value4 ==true)
                  publishMessage("8");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value4 == false)
                  publishMessage("9");
              } : null
              ,
              child: Toggle.passtoggle4? const Text('Opened') : const Text("CLOSED")
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
                  backgroundColor: Colors.indigo,
                  fixedSize: const Size(40, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)))
              ),
              child: Icon(Icons.power_settings_new , color : Toggle.ispressed ? Colors.green:  Colors.indigo.shade50),
              onPressed: state == MQTTAppConnectionState.disconnected
                  ? () {
                setState(() {
                  Toggle.ispressed = !Toggle.ispressed;
                });
                configureAndConnect();
              } : () {
                setState(() {
                  Toggle.ispressed = !Toggle.ispressed;
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
