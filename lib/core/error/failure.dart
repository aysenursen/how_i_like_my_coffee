// lib/core/error/failure.dart

/// Tüm özel hata sınıflarımızın türediği temel (abstract) sınıf.
abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

/// Uygulamanın genelinde kullanılabilecek Hata Sınıfları
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class GeneralFailure extends Failure {
  const GeneralFailure(String message) : super(message);
}
