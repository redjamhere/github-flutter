import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routeam/src/bloc/blocs.dart';
import 'package:routeam/src/utils/utils.dart';


class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<FavoriteBloc>(context).add(const FavoriteUpdateEvent());
            },
            icon: const Icon(Icons.restart_alt),
          )
        ],
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteErrorState) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is FavoriteLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is FavoriteSuccessState) {
            return ListView.builder(
              itemCount: state.result.length,
              itemBuilder: (BuildContext ctx, int index) =>
                  RepoListTile(repo: state.result[index]),
            );
          }

          if(state is FavoriteUpdateSuccessState) {
            if (state.result.isEmpty) {
              return Center(
                child: Text("Empty",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: RColors.rSecondary
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.result.length,
                itemBuilder: (BuildContext ctx, int index) =>
                    RepoListTile(repo: state.result[index]),
              );
            }
          }

          if (state is FavoriteEmptyState) {
            return Center(
              child: Text("Empty",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: RColors.rSecondary
                ),
              ),
            );
          }

          return const Center(
            child: Text('Unknow problem'),
          );
        },
      ),
    );
  }
}
