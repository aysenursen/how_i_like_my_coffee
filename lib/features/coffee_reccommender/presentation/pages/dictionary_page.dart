import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/dictionary_entry_entity.dart';
import 'package:get_it/get_it.dart';
import '../../domain/usecases/get_dictionary_use_case.dart';
import '../../../../core/constants/app_constants.dart';

// Basit bir FutureProvider ile veriyi direkt çekiyoruz
final dictionaryFutureProvider =
    FutureProvider<List<DictionaryEntryEntity>>((ref) async {
  final getDictionaryUseCase = GetIt.I<GetDictionaryUseCase>();

  // 1. Use Case'i çağır
  final resultEither = await getDictionaryUseCase();

  // 2. Either yapısını aç (fold metodu ile)
  return resultEither.fold(
    (failure) {
      // Hata durumunda (Left) bir istisna fırlatırız,
      // bu da FutureProvider'ın 'error' durumuna geçmesini sağlar.
      throw Exception(failure.message);
    },
    (data) {
      // Başarı durumunda (Right) veriyi döndürürüz.
      return data;
    },
  );
});

class DictionaryPage extends ConsumerWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dictionaryAsyncValue = ref.watch(dictionaryFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kahve Sözlüğü'),
        backgroundColor: Colors.brown.shade100,
      ),
      body: dictionaryAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Hata oluştu: $err')),
        data: (entries) {
          return ListView.builder(
            padding: const EdgeInsets.all(AppConstants.horizontalPadding),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Card(
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 12),
                child: ExpansionTile(
                  title: Text(
                    entry.term,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    entry.category,
                    style: TextStyle(color: Colors.brown.shade400),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        entry.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
