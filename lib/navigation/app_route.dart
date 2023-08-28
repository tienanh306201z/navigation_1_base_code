enum AppRoute { home, setting, login, splash }

extension AppRouteExtension on AppRoute {
  String get path =>
      "/${name.split(RegExp(r'(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])')).map((e) => e.toLowerCase()).join("-")}";
}

extension StringAppRouteExtension on String {
  AppRoute? get appRoute {
    final routeNameLowerCase = replaceAll("/", "").split("-").join();
    if (AppRoute.values
        .any((element) => element.name.toLowerCase() == routeNameLowerCase)) {
      return AppRoute.values.firstWhere(
          (element) => element.name.toLowerCase() == routeNameLowerCase);
    }
    return null;
  }
}
