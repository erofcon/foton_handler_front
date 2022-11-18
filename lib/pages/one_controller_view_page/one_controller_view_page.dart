import 'package:flutter/material.dart';
import 'package:foton_handler_front/pages/one_controller_view_page/controllers/one_controller_view_page_controller.dart';
import 'package:foton_handler_front/shared_components/customAppBar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/helpers.dart';
import 'components/controller_header.dart';
import 'models/get_controllers_data_response.dart';

class OneControllerViewPage extends StatelessWidget {
  const OneControllerViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            ControllerHeader(),
            Divider(),
            Expanded(child: _DataChart()),
          ],
        ),
      ),
    );
  }
}

class _DataChart extends GetView<OneControllerViewPageController> {
  const _DataChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loadData.isTrue) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            enablePinching: true,
            enableMouseWheelZooming:
                controller.chartData.isNotEmpty ? true : false,
          ),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(),
          title: ChartTitle(text: 'chart_title'.tr),
          legend: Legend(isVisible: true, position: LegendPosition.top),
          trackballBehavior: TrackballBehavior(
              enable: true,
              lineColor: const Color.fromRGBO(255, 255, 255, 0.03),
              lineWidth: 15,
              activationMode: ActivationMode.longPress,
              markerSettings: const TrackballMarkerSettings(
                  borderWidth: 4,
                  height: 10,
                  width: 10,
                  markerVisibility: TrackballVisibilityMode.visible)),
          tooltipBehavior: TooltipBehavior(
            enable: true,
            color: Theme.of(context).appBarTheme.backgroundColor,
            textStyle: const TextStyle(color: Colors.white),
          ),
          series: getData(),
        );
      }
    });
  }

  List<LineSeries<GetControllersDataResponse, String>> getData() {
    return <LineSeries<GetControllersDataResponse, String>>[
      LineSeries(
        dataSource: controller.chartData,
        xValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.createDataDateTime != null
                ? convertDate(dataResponse.createDataDateTime!)
                : '',
        yValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.vin != null
                ? numConvert(dataResponse.vin!).toDouble()
                : 0,
        name: 'vin'.tr,
        color: const Color.fromRGBO(76, 149, 108, 1),
        width: 4,
      ),
      LineSeries(
        dataSource: controller.chartData,
        xValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.createDataDateTime != null
                ? convertDate(dataResponse.createDataDateTime!)
                : '',
        yValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.vout != null
                ? numConvert(dataResponse.vout!).toDouble()
                : 0,
        name: 'vout'.tr,
        color: const Color.fromRGBO(136, 150, 150, 1),
        width: 4,
      ),
      LineSeries(
        dataSource: controller.chartData,
        xValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.createDataDateTime != null
                ? convertDate(dataResponse.createDataDateTime!)
                : '',
        yValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.temp ?? 0,
        name: 'temp'.tr,
        color: Colors.blue[300],
        width: 4,
      ),
      LineSeries(
        dataSource: controller.chartData,
        xValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.createDataDateTime != null
                ? convertDate(dataResponse.createDataDateTime!)
                : '',
        yValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.charge ?? 0,
        name: 'charge'.tr,
        color: const Color.fromRGBO(158, 197, 171, 1),
        width: 4,
      ),
      LineSeries(
        dataSource: controller.chartData,
        xValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.createDataDateTime != null
                ? convertDate(dataResponse.createDataDateTime!)
                : '',
        yValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.relay ?? 0,
        name: 'relay'.tr,
        color: const Color.fromRGBO(156, 137, 184, 1),
        width: 4,
      ),
      LineSeries(
        dataSource: controller.chartData,
        xValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.createDataDateTime != null
                ? convertDate(dataResponse.createDataDateTime!)
                : '',
        yValueMapper: (GetControllersDataResponse dataResponse, _) =>
            dataResponse.relay ?? 0,
        name: 'status'.tr,
        color: const Color.fromRGBO(240, 166, 202, 1),
        width: 4,
      ),
    ];
  }
}
