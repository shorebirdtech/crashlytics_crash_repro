import 'package:crashlytics_demo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Crash me'),
                onPressed: () {
                  try {
                    throw Exception('This is a crash');
                  } catch (exception, stackTrace) {
                    FirebaseCrashlytics.instance.recordError(
                      exception,
                      stackTrace,
                      fatal: true,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
