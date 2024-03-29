import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'src/restaurant_search_app.dart';
import './src/app_state.dart';
import './src/api.dart';

void main() async {
  await DotEnv().load(fileName: '.env');

  final api = ZomatoApi(DotEnv().env['ZOMATO_API_KEY']!);
  await api.loadCategories();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => api),
        Provider(create: (context) => AppState()),
      ],
      child: MyApp(),
    ),
  );
}
