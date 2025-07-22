import '../domain/models/Crypto.dart';

class HomeBlocState {
  final List<Crypto> cryptos;
  final bool isLoadingCryptos;

  HomeBlocState({
    required this.cryptos,
    this.isLoadingCryptos = false,
  });

  HomeBlocState copyWith({
    List<Crypto>? cryptos,
    bool? isLoadingCryptos,
  }) {
    return HomeBlocState(
      cryptos: cryptos ?? this.cryptos,
      isLoadingCryptos: isLoadingCryptos ?? this.isLoadingCryptos,
    );
  }
}