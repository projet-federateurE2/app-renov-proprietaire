import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/left_side_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundGreenWave(),
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                const LeftSideBar(),
                Expanded(
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
