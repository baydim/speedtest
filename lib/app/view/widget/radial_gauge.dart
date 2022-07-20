import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedtest/app/controller/home_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// Widget getRadialGauge() {
//   return
// }

class GetRadialGauge extends StatefulWidget {
  const GetRadialGauge({Key? key}) : super(key: key);

  @override
  State<GetRadialGauge> createState() => _GetRadialGaugeState();
}

class _GetRadialGaugeState extends State<GetRadialGauge> {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Container(
          child: Column(
            children: [
              SfRadialGauge(
                enableLoadingAnimation: true,
                title: const GaugeTitle(
                    text: 'INTERNET SPEED',
                    textStyle:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 10,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 3,
                          color: Colors.green,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 3,
                          endValue: 7,
                          color: Colors.orange,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 7,
                          endValue: 10,
                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10)
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: _.transferRateConsume.value,
                        enableAnimation: true,
                        animationDuration: 500,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          color: Colors.green,
                          child: Text(
                            _.transferRateConsume.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      )
                    ],
                  )
                ],
              ),
              Text(_.transferRateConsume.value.toString()),
            ],
          ),
        );
      },
    );
  }
}
