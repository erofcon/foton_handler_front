import 'package:flutter/material.dart';
import 'package:foton_handler_front/shared_components/customAppBar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'components/controller_header.dart';

class OneControllerViewPage extends StatelessWidget {
  const OneControllerViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const ControllerHeader(),
            const Divider(),
            SizedBox(
              height: context.height,
              child: _MyHomePage(),
            ),
            // ControllerIndicators(),
            // SimpleLineChart(),
          ],
        ),
      ),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Initialize the chart widget
      SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Half yearly sales analysis'),
          // Enable legend
          legend: Legend(isVisible: true, position: LegendPosition.top),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Sales1',
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
            LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Sales2',
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            )
          ]),
    ]);
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
