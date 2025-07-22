import 'package:archonit_test/bloc/home_bloc.dart';
import 'package:archonit_test/bloc/home_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/crypto_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        context.read<HomeBloc>().getCryptos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeBlocState>(
        builder: (BuildContext context, state) {
          return ListView.builder(
              controller: _scrollController,
              itemCount: state.cryptos.length,
              padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).padding.top),
              itemBuilder: (ctx, index) {
                return CryptoItem(
                  key: ValueKey(state.cryptos[index].id),
                  item: state.cryptos[index],
                );
              });
        },
      ),
    );
  }
}
