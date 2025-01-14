import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../plugins/chart_defines.dart';
import '../../service/app_database_service.dart';
import '../blocs/explore/explore_cubits.dart';
import '../blocs/settings_cubit/settings_cubit.dart';
import '../route/global_str_consts.dart';
import 'chart_widget.dart';

class CaraouselWidget extends StatefulWidget {
  CaraouselWidget({
    super.key,
  }) {
    // chartInfoList.shuffle();
  }

  @override
  State<CaraouselWidget> createState() => _CaraouselWidgetState();
}

class _CaraouselWidgetState extends State<CaraouselWidget> {
  bool _visibility = true;

  // final FetchChartCubit fetchChartCubit;
  List<ChartCubit> chartCubitList = List.empty(growable: true);
  List<ChartInfo> selectedCharts = List.empty(growable: true);
  Map<dynamic, dynamic> chartMap = {};
  bool autoSlideCharts = true;
  StreamSubscription? ss;

  Future<void> initSettings() async {
    autoSlideCharts = await AppDatabaseService.getSettingBool(GlobalStrConsts.autoSlideCharts) ?? true;
    setState(() {});
  }

  void getSelectedCharts(Map sChartMap) {
    if (!mapEquals(chartMap, sChartMap) || selectedCharts.isEmpty) {
      selectedCharts.clear();
      chartCubitList.clear();
      for (var e in ChartInfo.chartInfoList) {
        if (sChartMap[e.title] == null || sChartMap[e.title] == true) {
          selectedCharts.add(e);
          chartCubitList.add(
            ChartCubit(e, context.read<FetchChartCubit>()),
          );
        }
      }
      if (mounted) {
        setState(() {
          log('selected charts: ${selectedCharts.length.toString()}', name: 'ChartCarousel');
        });
      }
    }
    chartMap = sChartMap;
  }

  @override
  void initState() {
    initSettings();
    getSelectedCharts(context.read<SettingsCubit>().state.chartMap);
    ss = context.read<SettingsCubit>().stream.listen((event) {
      if (autoSlideCharts != event.autoSlideCharts) {
        autoSlideCharts = event.autoSlideCharts;
        if (autoSlideCharts) {
          log("Auto Slide Charts Enabled");
        } else {
          log("Auto Slide Charts Disabled");
        }
      }
      getSelectedCharts(event.chartMap);
    });
    super.initState();
  }

  @override
  void dispose() {
    ss?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return selectedCharts.isEmpty
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    Positioned(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 80),
                        opacity: _visibility ? 1.0 : 0.0,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Row(
                              children: [
                                // Text(
                                //   "Featured",
                                //   style: Default_Theme.secondoryTextStyle.merge(
                                //       const TextStyle(
                                //           color: Default_Theme.primaryColor1,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 19)),
                                // ),
                                // const Icon(
                                //   FontAwesome.bolt_lightning_solid,
                                //   color: Default_Theme.primaryColor1,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, _) {
                          setState(() {
                            _visibility = index == 0;
                          });
                        },
                        height: ResponsiveBreakpoints.of(context).isMobile || ResponsiveBreakpoints.of(context).isTablet
                            ? MediaQuery.of(context).size.height * 0.36
                            : 250,
                        viewportFraction: ResponsiveBreakpoints.of(context).isMobile
                            ? 0.65
                            : ResponsiveBreakpoints.of(context).isTablet
                                ? 0.30
                                : 0.25,
                        autoPlay: autoSlideCharts,
                        autoPlayInterval: const Duration(milliseconds: 2500),
                        // aspectRatio: 15 / 16,
                        // enableInfiniteScroll: true,
                        enlargeFactor: 0.2,
                        initialPage: 0,
                        pauseAutoPlayOnTouch: true,
                        enlargeCenterPage: true,
                      ),
                      items: [
                        for (int i = 0; i < selectedCharts.length; i++)
                          if (state.chartMap[selectedCharts[i].title] == null ||
                              state.chartMap[selectedCharts[i].title] == true)
                            BlocProvider.value(
                              value: chartCubitList[i],
                              child: GestureDetector(
                                onTap: () => GoRouter.of(context).pushNamed(
                                  GlobalStrConsts.chartScreen,
                                  pathParameters: {
                                    "chartName": selectedCharts[i].title,
                                  },
                                ),
                                child: ChartWidget(
                                  chartInfo: selectedCharts[i],
                                ),
                              ),
                            ),
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }
}
