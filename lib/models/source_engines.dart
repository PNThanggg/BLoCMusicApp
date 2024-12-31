enum SourceEngine {
  engJIS("JISaavn"),
  engYTM("YTMusic"),
  engYTV("YTVideo");

  final String value;

  const SourceEngine(this.value);
}

Map<SourceEngine, List<String>> sourceEngineCountries = {
  SourceEngine.engJIS: [
    "IN",
    "NP",
    "BT",
    "LK",
  ],
  SourceEngine.engYTM: [],
  SourceEngine.engYTV: [],
};

// Future<List<SourceEngine>> availableSourceEngines() async {
//   String country = await BloomeeDBService.getSettingStr(GlobalStrConsts.countryCode) ?? "IN";
//
//   List<SourceEngine> availSourceEngines = [];
//   for (var engine in SourceEngine.values) {
//     bool isAvailable = await BloomeeDBService.getSettingBool(engine.value) ?? true;
//     if (isAvailable == true) {
//       if (sourceEngineCountries[engine]!.contains(country) || sourceEngineCountries[engine]!.isEmpty) {
//         availSourceEngines.add(engine);
//       }
//     }
//   }
//
//   return availSourceEngines;
// }
