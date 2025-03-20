import 'package:flutter/material.dart';

class BulbScreen extends StatefulWidget {
  const BulbScreen({super.key});

  @override
  State<BulbScreen> createState() => _BulbScreenState();
}

class _BulbScreenState extends State<BulbScreen> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row( 
               mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                Text(
                 'If you want to turn on the bulb,\n press the button below',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isOn ? 'Bulb is ON' : 'Bulb is OFF',
                  style: TextStyle(
                    color: isOn ? Colors.yellow : Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                if (isOn)
                  Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.8),
                          blurRadius: 70,
                          spreadRadius: 40,
                        ),
                      ],
                    ),
                  ),
                Image.asset(
                  isOn ? 'assets/on.png' : 'assets/of.png', // Bulb image
                  width: 300,
                  height: 300,
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Button as Image
            GestureDetector(
              onTap: () {
                setState(() {
                  isOn = !isOn;
                });
              },
              child: Image.asset(
                isOn ? 'assets/onn.png' : 'assets/offf.png', // Button images
                width: 170, // Adjust size as needed
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
