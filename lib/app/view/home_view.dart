import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speedtest/app/controller/home_controller.dart';

import 'widget/radial_gauge.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController h = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GetRadialGauge(),
            IconButton(
                onPressed: () {
                  h.download();
                },
                icon: Icon(Icons.download)),
            IconButton(
                onPressed: () {
                  h.upload();
                },
                icon: Icon(Icons.upload)),
          ],
        ),
      ),
    );
  }
}
