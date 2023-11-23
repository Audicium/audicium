import 'package:audicium/navigation/routes.dart';
import 'package:audicium/pages/player/player_service.dart';
import 'package:audicium/services/init.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await initMediaPlayer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        title: 'Audicium',
        routerConfig: mobileRouter,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
