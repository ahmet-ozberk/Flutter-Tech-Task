import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/constants/app_constant.dart';
import 'app/constants/string_constant.dart';
import 'app/route/app_router.dart';
import 'app/services/dio_services.dart';
import 'app/services/local_storage_service.dart';
import 'package:grock/grock.dart';

import 'app/constants/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.initPrefs();
  await DioService.instance.init(baseUrl: AC.baseUrl);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: SC.appName,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
      routerConfig: ref.read(routerProvider).config(),
      theme: appThemeData,
    );
  }
}
