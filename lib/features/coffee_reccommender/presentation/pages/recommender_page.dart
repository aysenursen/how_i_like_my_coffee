import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:how_i_like_my_coffee/core/constants/app_constants.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/presentation/pages/dictionary_page.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/presentation/pages/result_page.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/presentation/viewmodels/recommender_state.dart';

import '../viewmodels/recommender_view_model.dart';

class RecommenderPage extends ConsumerStatefulWidget {
  const RecommenderPage({super.key});

  @override
  ConsumerState<RecommenderPage> createState() => _RecommenderPageState();
}

class _RecommenderPageState extends ConsumerState<RecommenderPage> {
  // Kullanıcının anlık seçimlerini tutacak yerel state'ler
  String _selectedTemperature =
      AppConstants.temperatureOptions.first; // Sabitten çekiliyor
  String _selectedBody = AppConstants.bodyOptions.first; // Sabitten çekiliyor
  List<String> _selectedAromas = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<RecommenderState>(recommenderViewModelProvider,
        (previous, next) {
      next.whenOrNull(
        loading: () {
          // Yükleme sırasında Navigator.pop() yaparak gereksiz
          // yönlendirmeyi önlemek daha güvenlidir.
          // Şimdilik boş bırakıyoruz, çünkü yükleme durumunu
          // butonda zaten gösteriyoruz.
        },
        loaded: (recommendations) {
          // Öneri başarıyla geldiyse Sonuç sayfasına yönlendir
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ResultPage(recommendations: recommendations),
            ),
          );
        },
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Hata: $message')),
          );
        },
      );
    });

    // ViewModel'ın mevcut durumunu oku
    final recommenderState = ref.watch(recommenderViewModelProvider);
    // ... Geri kalan kod (isLoading tanımı vs.) aynı kalır ...

    final isLoading = recommenderState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kahvemi Nasıl Severim?'),
        actions: [
          // Sözlük sayfasına geçiş (Faz C.4 için yer tutucu)
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              // SÖZLÜK SAYFASINA YÖNLENDİRME AKTİF
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DictionaryPage()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Sıcaklık Seçimi
            _buildSectionTitle('1. Sıcaklık Tercihi'),
            _buildTemperatureToggle(),
            const SizedBox(height: AppConstants.verticalSpacing),

            // 2. Gövde/Yoğunluk Seçimi
            _buildSectionTitle('2. Gövde (Yoğunluk)'),
            _buildBodyChips(),
            const SizedBox(height: AppConstants.verticalSpacing),

            // 3. Aroma Profili Seçimi
            _buildSectionTitle('3. Sevdiğiniz Aromalar'),
            _buildAromaChips(),
            const SizedBox(height: AppConstants.verticalSpacing),

            // 4. Kahve Bul Butonu
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.local_cafe),
                label: Text(isLoading ? 'Öneri Aranıyor...' : 'Kahvemi Bul'),
                onPressed: isLoading || _selectedAromas.isEmpty
                    ? null // Yüklenirken veya aroma seçilmemişken butonu devre dışı bırak
                    : () {
                        // ViewModel'ı çağır, işi Domain katmanına gönder!
                        ref
                            .read(recommenderViewModelProvider.notifier)
                            .getRecommendation(
                              temperature: _selectedTemperature,
                              body: _selectedBody,
                              aromas: _selectedAromas,
                            );
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Yardımcı Widget Metotları ---

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 10.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTemperatureToggle() {
    return ToggleButtons(
      isSelected: [
        _selectedTemperature == AppConstants.temperatureOptions[0],
        _selectedTemperature == AppConstants.temperatureOptions[1]
      ],
      onPressed: (index) {
        setState(() {
          _selectedTemperature = AppConstants.temperatureOptions[index];
        });
      },
      borderRadius: BorderRadius.circular(8.0),
      children: const [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Sıcak ☕️')),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Soğuk 🧊')),
      ],
    );
  }

  Widget _buildBodyChips() {
    return Wrap(
      spacing: 8.0,
      children: AppConstants.bodyOptions.map((body) {
        return ChoiceChip(
          label: Text(body),
          selected: _selectedBody == body,
          onSelected: (selected) {
            if (selected) {
              setState(() {
                _selectedBody = body;
              });
            }
          },
        );
      }).toList(),
    );
  }

  Widget _buildAromaChips() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: AppConstants.aromaOptions.map((aroma) {
        final isSelected = _selectedAromas.contains(aroma);
        return FilterChip(
          label: Text(aroma),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedAromas.add(aroma);
              } else {
                _selectedAromas.remove(aroma);
              }
            });
          },
        );
      }).toList(),
    );
  }
}
