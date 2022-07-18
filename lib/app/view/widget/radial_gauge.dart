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
    return GetBuilder<HomeController>(
      builder: (_) {
        return Container(
          child: SfRadialGauge(
            title: const GaugeTitle(
                text: 'Speedometer',
                textStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 150,
                ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 50,
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 50,
                      endValue: 100,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 100,
                      endValue: 150,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10)
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: _.transferRateConsume,
                    enableDragging: true,
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
                      positionFactor: 0.5)
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
