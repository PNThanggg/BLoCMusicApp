import 'package:display_mode/display_mode.dart';
import 'package:display_mode/model/display_mode_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DisplayModeModel> modes = <DisplayModeModel>[];
  DisplayModeModel? active;
  DisplayModeModel? preferred;

  final ValueNotifier<int> page = ValueNotifier<int>(0);
  late final PageController controller = PageController()
    ..addListener(() {
      page.value = controller.page!.round();
    });

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchAll();
    });
  }

  Future<void> fetchAll() async {
    try {
      modes = await DisplayMode.supported;
      modes.forEach(print);

      /// On OnePlus 7 Pro:
      /// #1 1080x2340 @ 60Hz
      /// #2 1080x2340 @ 90Hz
      /// #3 1440x3120 @ 90Hz
      /// #4 1440x3120 @ 60Hz

      /// On OnePlus 8 Pro:
      /// #1 1080x2376 @ 60Hz
      /// #2 1440x3168 @ 120Hz
      /// #3 1440x3168 @ 60Hz
      /// #4 1080x2376 @ 120Hz
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }

      /// e.code =>
      /// noAPI - No API support. Only Marshmallow and above.
      /// noActivity - Activity is not available. Probably app is in background
    }

    preferred = await DisplayMode.preferred;

    active = await DisplayMode.active;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: PageView(
            controller: controller,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Available modes',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          fetchAll();
                        },
                        label: const Text('Fetch'),
                      ),
                    ],
                  ),
                  if (modes.isEmpty) const Text('Nothing here'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: modes.length,
                      itemBuilder: (_, int i) {
                        final DisplayModeModel mode = modes[i];
                        return Row(
                          children: <Widget>[
                            Radio<DisplayModeModel>(
                              value: mode,
                              groupValue: preferred,
                              onChanged: (DisplayModeModel? newMode) async {
                                await DisplayMode.setPreferredMode(newMode!);
                                await Future<dynamic>.delayed(
                                  const Duration(milliseconds: 100),
                                );
                                await fetchAll();
                                setState(() {});
                              },
                            ),
                            if (mode == DisplayModeModel.auto) const Text('Automatic') else Text(mode.toString()),
                            if (mode == active) const Text(' [ACTIVE]'),
                          ],
                        );
                      },
                    ),
                  ),
                  if (modes.isNotEmpty) const Divider(),
                  if (modes.isNotEmpty)
                    Row(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () async {
                            await DisplayMode.setHighRefreshRate();
                            await Future<dynamic>.delayed(
                              const Duration(milliseconds: 100),
                            );
                            await fetchAll();
                            setState(() {});
                          },
                          child: const Text('Highest Hz'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            await DisplayMode.setLowRefreshRate();
                            await Future<dynamic>.delayed(
                              const Duration(milliseconds: 100),
                            );
                            await fetchAll();
                            setState(() {});
                          },
                          child: const Text('Lowest Hz'),
                        ),
                      ],
                    ),
                  const Divider(),
                ],
              ),
              ListView.builder(
                itemBuilder: (BuildContext _, int i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Index: $i'),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: page,
          builder: (_, int page, __) => BottomNavigationBar(
            currentIndex: page,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.android),
                label: 'Modes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Lists',
              ),
            ],
            onTap: (int i) => controller.animateToPage(
              i,
              duration: kTabScrollDuration,
              curve: Curves.easeOutQuart,
            ),
          ),
        ),
      ),
    );
  }
}
