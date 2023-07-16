
import 'dart:io' show Platform;
import 'package:besafe/presentation/screens/mqtt/mqtt/MQTTManager.dart';
import 'package:besafe/presentation/screens/mqtt/mqtt/state/MQTTAppState.dart';
import 'package:besafe/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Doors extends StatefulWidget {
  @override
  State<StatefulWidget> createState(

      ) {
    return _DoorsState();
  }
}

class _DoorsState extends State<Doors> {
 

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
                  'Control Your Doors',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevatedButton1with(currentAppState.getAppConnectionState),
              SizedBox(height: 20,),
              buildElevatedButton2with(currentAppState.getAppConnectionState),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevatedButton3with(currentAppState.getAppConnectionState),
                 SizedBox(height: 20,),
              buildElevatedButton4with(currentAppState.getAppConnectionState),
            ],
          ),
        ],
      ),
    );
  }

  /*Main Door   */
  Widget buildElevatedButton1with(MQTTAppConnectionState state) {
    return Container(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Main Door ',
                style:
                TextStyle(fontSize: 18, color: Colors.grey),
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
                backgroundColor: Color( Toggle.passtoggle13 ? 0xffdaa520 : 0xff023859,
                ),
                fixedSize: const Size(90, 30),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value13 = !SwitchValues.value13;
                });
                setState(() {
                  Toggle.passtoggle13 = !Toggle.passtoggle13;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value13 ==true)
                  publishMessage("A");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value13 == false)
                  publishMessage("27");
              } : null
              , child: Toggle.passtoggle13? const Text("OPEND") : const Text("CLOSED")
          ),
        ],
      ),
    );

  }
  /* living door  */
  Widget buildElevatedButton2with(MQTTAppConnectionState state) {
    return Container(
    padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
          width: double.infinity,
          height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Living Room\'s Door',
                style:
                TextStyle(fontSize: 18, color: Colors.grey),
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
                  fixedSize: const Size(90, 30),
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
              , child: Toggle.passtoggle4? const Text("OPEND") : const Text("CLOSED")
          ),
        ],
      ),
    );
  }

  /* Reception door  */
  Widget buildElevatedButton3with(MQTTAppConnectionState state) {
    return Container(
    padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
          width: double.infinity,
          height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Reception  Door',
                style:
                TextStyle(fontSize: 18, color: Colors.grey),
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
                  fixedSize: const Size(90, 30),
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
                  Toggle.passtoggle8= !Toggle.passtoggle8;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value8 ==true)
                  publishMessage("K");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value8== false)
                  publishMessage("J");
              } : null
              , child: Toggle.passtoggle8?const Text("OPEND") : const Text("CLOSED")
          ),
        ],
      ),
    );
  }

  /*  bedroom Door    */
  Widget buildElevatedButton4with(MQTTAppConnectionState state) {
    return Container(
       padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
          width: double.infinity,
          height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Bed Room Door',
                style:
                TextStyle(fontSize: 18, color: Colors.grey),
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
                  backgroundColor: Color( Toggle.passtoggle12 ? 0xffdaa520 : 0xff023859,
                  ),
                   fixedSize: const Size(90, 30),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)))
              ),
              onPressed: state == MQTTAppConnectionState.connected
                  ? () {
                setState(() {
                  SwitchValues.value12 = !SwitchValues.value12;
                });
                setState(() {
                  Toggle.passtoggle12 = !Toggle.passtoggle12;
                });
                if(state == MQTTAppConnectionState.connected &&SwitchValues.value12 ==true)
                  publishMessage("B");
                else if(state == MQTTAppConnectionState.connected && SwitchValues.value12 == false)
                  publishMessage("C");
              } : null
              , child: Toggle.passtoggle12? const Text("OPENED") : const Text("CLOSED")
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
//final String message = osPrefix + ' says: ' + text;