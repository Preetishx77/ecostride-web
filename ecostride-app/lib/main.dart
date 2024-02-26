import 'package:ecostrider/data/applianceModel.dart';
import 'package:ecostrider/data/campaignModel.dart';
import 'package:ecostrider/data/electricityModel.dart';
import 'package:ecostrider/data/fuelModel.dart';
import 'package:ecostrider/data/vehicleModel.dart';
import 'package:ecostrider/firebase_options.dart';
import 'package:ecostrider/pages/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool shouldUseFirebaseEmulator = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedVehicle.instance),
        ChangeNotifierProvider(create: (context) => ApplianceModel.instance),
        ChangeNotifierProvider(create: (context) => ElectricityModel.instance),
        ChangeNotifierProvider(create: (context) => FuelModel.instance),
        ChangeNotifierProvider(create: (context) => CampaignMap.instance),
      ],
      child: MaterialApp(
        title: 'Ecostride',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
