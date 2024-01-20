import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/components.dart';
import 'package:pos_system/cubit/cubit_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _noButtonX = 0;
  double _noButtonY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/1.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  CubitCubit.get(context).yes == false
                      ? 'Takly M3aya?'
                      : 'Yaslaaaaaaam',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Lottie.asset(
                    CubitCubit.get(context).yes == false
                        ? 'assets/jsons/sloth.json'
                        : 'assets/jsons/happy_sloth.json',
                    width: MediaQuery.of(context).size.width / 2 + 50,
                    height: MediaQuery.of(context).size.height / 3 + 50,
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CubitCubit.get(context).yes == false
                        ? Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    button(
                                      height: 50,
                                      context: context,
                                      function: () {
                                        setState(() {});
                                        CubitCubit.get(context).makeYes();
                                      },
                                      text: 'YES',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Transform.translate(
                                offset: Offset(_noButtonX, _noButtonY),
                                child: outlinedButton(
                                  height: 50,
                                  width: 80,
                                  function: () {
                                    setState(() {
                                      _noButtonX = Random().nextDouble() * 30;
                                      _noButtonY = Random().nextDouble() * 30;
                                    });
                                  },
                                  text: 'NO',
                                ),
                              ),
                            ],
                          )
                        : const Text(
                            'A7la 3zoma Inshallah',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 520,
            child: Transform.rotate(
              angle: pi / 12.0,
              child: Image.asset(
                'assets/images/arrow2.png',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Positioned(
            top: 520,
            left: CubitCubit.get(context).yes == false ? 240 : 320,
            child: Transform.rotate(
              angle: pi / 12.0,
              child: Image.asset(
                'assets/images/arrow3.png',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: CubitCubit.get(context).yes == false ? 240 : 320,
            child: Transform.rotate(
              angle: pi / 12.0,
              child: Image.asset(
                'assets/images/arrow4.png',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Positioned(
            top: 650,
            child: Transform.rotate(
              angle: pi / 12.0,
              child: Image.asset(
                'assets/images/arrow.png',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
