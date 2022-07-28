import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:routeam/src/utils/utils.dart';
import 'package:routeam/src/views/favorites_view.dart';

import '../bloc/blocs.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<FavoriteBloc>(context).add(const FavoriteGetEvent());
            },
            icon: const Icon(Icons.favorite_border),
          )
        ],
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SearchSuccessState) {
            return ListView.builder(
              itemCount: state.result.length,
              itemBuilder: (BuildContext ctx, int index) =>
                  RepoListTile(repo: state.result[index])
            );
          }
          return const Center(
            child: Text('Unknow problem'),
          );
        },
      )
    );
  }
}
