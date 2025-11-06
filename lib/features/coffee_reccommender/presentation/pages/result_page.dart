import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/coffee_profile_entity.dart';
import '../../../../core/constants/app_constants.dart';

class ResultPage extends ConsumerWidget {
  final List<CoffeeProfileEntity> recommendations;

  const ResultPage({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Eğer öneri listesi boşsa (ViewModel'da hata veya sonuçsuzluk durumu)
    if (recommendations.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sonuç Bulunamadı')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.horizontalPadding),
            child: Text(
              'Tercihlerinize uyan bir kahve profili maalesef bulunamadı. Lütfen seçimlerinizi değiştirerek tekrar deneyin.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    // En iyi öneri (listenin ilk elemanı)
    final topRecommendation = recommendations.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sizin İçin Önerimiz!'),
        backgroundColor: Colors.brown.shade100,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Önerilen Kahve Adı ve Kökeni ---
            Text(
              topRecommendation.name,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade800,
                  ),
            ),
            Text(
              'Köken: ${topRecommendation.origin}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppConstants.verticalSpacing),

            // --- 2. Neden Bu Öneri? (Açıklama) ---
            _buildSectionTitle(context, 'Neden Bu Öneri?'),
            Card(
              color: Colors.brown.shade50,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  topRecommendation.explanation,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.verticalSpacing),

            // --- 3. Temel Özellikler (Chips) ---
            _buildSectionTitle(context, 'Temel Özellikler'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildFeatureChip(
                    Icons.thermostat, topRecommendation.temperature),
                _buildFeatureChip(
                    Icons.coffee_maker, 'Gövde: ${topRecommendation.body}'),
                ...topRecommendation.aromas
                    .map((a) => _buildFeatureChip(Icons.lens_blur, a))
                    .toList(),
              ],
            ),
            const SizedBox(height: AppConstants.verticalSpacing * 2),

            // --- 4. Eylem Butonu ---
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Favorilere kaydetme mantığı buraya gelecek.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Favorilere eklendi! (Henüz tam işlevsel değil)')),
                  );
                },
                icon: const Icon(Icons.favorite),
                label: const Text('Bu Kahveyi Favorilere Kaydet'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Yardımcı Widget Metotları ---
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade700,
            ),
      ),
    );
  }

  Widget _buildFeatureChip(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, color: Colors.brown.shade800, size: 18),
      label: Text(label),
      backgroundColor: Colors.amber.shade100,
      side: BorderSide.none,
    );
  }
}
