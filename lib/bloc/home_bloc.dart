import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';
import '../domain/irepository.dart';
import '../domain/models/Crypto.dart';
import 'home_bloc_state.dart';

class HomeBloc extends Cubit<HomeBlocState> {
  HomeBloc() : super(HomeBlocState(cryptos: [])) {
    repo = CoinRepository.instance;
    load();
  }

  int offset = 0;

  late final IRepository repo;

  load() {
    getCryptos();
  }

  getCryptos() async {
    if(state.isLoadingCryptos) return;
    emit(state.copyWith(isLoadingCryptos: true));
    final data = await repo.getAssets(skip: offset);
    final mergedData = List<Crypto>.from(state.cryptos)..addAll(data);
    emit(state.copyWith(cryptos: mergedData, isLoadingCryptos: false));
    offset += 15;
  }
}
