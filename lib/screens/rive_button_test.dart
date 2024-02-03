import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveButtonTest extends StatefulWidget {
  const RiveButtonTest({super.key});

  @override
  State<RiveButtonTest> createState() => _RiveButtonTestState();
}

class _RiveButtonTestState extends State<RiveButtonTest> {
  String buttonStatus = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Rive Button Showcase'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            width: 250,
            height: 250,
            child: RiveAnimation.asset(
              'animation_rive/button_demo.riv',
              fit: BoxFit.fitWidth,
              onInit: (Artboard art) {
                StateMachineController? controller =
                    StateMachineController.fromArtboard(
                  art,
                  "State Machine 1",
                  onStateChange: (stateMachineName, stateName) {
                    switch (stateName) {
                      case 'Button Pressed':
                        setState(() {
                          buttonStatus = stateName;
                        });
                        break;
                      case 'Button Released':
                        setState(() {
                          buttonStatus = stateName;
                        });
                        break;
                      default:
                        setState(() {
                          buttonStatus = stateName;
                        });
                    }
                  },
                );

                if (controller != null) {
                  art.addController(controller);
                }
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Text(buttonStatus),
        ],
      )),
    );
  }
}
