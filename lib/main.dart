import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:how_i_like_my_coffee/core/di/di_container.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/presentation/pages/recommender_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How I Like My Coffee',
      theme: ThemeData(
        // Kahve tonlarına yakın bir renk şeması
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          primary: Colors.brown.shade700,
          secondary: Colors.amber.shade400,
        ),
        useMaterial3: true,
      ),
      home: const RecommenderPage(), // BAŞLANGIÇ SAYFASI
    );
  }
}
