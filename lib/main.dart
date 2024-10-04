import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspira/app/data/services/auth_service.dart';
import 'package:inspira/app/ui/pages/avaluation/avaluation_page.dart';
import 'package:inspira/app/ui/pages/home/home_page.dart';
import 'package:inspira/app/ui/pages/login/login_page.dart';
import 'package:inspira/app/ui/pages/splash/splash_page.dart';
import 'package:inspira/app/ui/pages/team_selection/team_selection_page.dart';
import 'package:inspira/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inspira',
        routes: {
          '/': (context) => const SplashPage(),
          '/avaluation': (context) {
            final args = ModalRoute.of(context)?.settings.arguments as List;
            return AvaluationPage(name: args[0], team: args[1]);
          },
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/team_selection': (context) {
            final args = ModalRoute.of(context)?.settings.arguments as String;
            return TeamSelection(name: args);
          }
        },
      ),
    );
  }
}
