import 'package:besafe/Rooms/LivingRoom.dart';
import 'package:besafe/Rooms/Reception.dart';
import 'package:besafe/Rooms/doors.dart';
import 'package:besafe/components/component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Rooms/bedRoom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'WELCOME HOME',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 135,
                    child: Icon(
                      Icons.bar_chart_rounded,
                      color: Colors.indigo,
                      size: 28,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/smart-home.png',
                        scale: 1.5,
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Control Your Home',
                        style: TextStyle(
                            fontSize: 25,
                            textBaseline: TextBaseline.alphabetic,
                            color: Colors.indigo
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        cardMenu(
                            icon: Icons.tv,
                            title: 'Living Room',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Living()));
                            }),
                        const SizedBox(
                          width: 20,
                        ),
                        cardMenu(
                            icon: Icons.chair_rounded,
                            title: 'Reception',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Reception()));
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        cardMenu(
                            icon: Icons.bed,
                            title: 'Bed Room',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BedRoom()));
                            }),
                        const SizedBox(
                          width: 20,
                        ),
                        cardMenu(
                            icon: Icons.door_back_door_outlined,
                            title: 'Doors',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Doors()));
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
