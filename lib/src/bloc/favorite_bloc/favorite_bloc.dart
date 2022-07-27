import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:routeam/src/models/reposotitory_model.dart';

import '../../repositories/repositories.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';


class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteBloc({required this.favoriteRepository})
    : super(const FavoriteInitialState()) {
    on<FavoriteGetEvent>(_onFavoriteGet);
    on<FavoriteSaveEvent>(_onFavoriteSave);
    on<FavoriteRemoveEvent>(_onFavoriteRemove);
  }

  void _onFavoriteGet (
    FavoriteGetEvent event,
    Emitter<FavoriteState> emit
  ) async {
    emit(const FavoriteLoadingState());
    try {
      final List<RepositoryModel> _result = await favoriteRepository.getFavoriteRepositories();
      if (_result.isEmpty) {
        emit(const FavoriteEmptyState());
      } else {
        emit(FavoriteSuccessState(_result));
      }
    } catch (err) {
      emit(FavoriteErrorState(err.toString()));
    }
  }

  void _onFavoriteSave(
      FavoriteSaveEvent event,
      Emitter<FavoriteState> emit
  ) async {
    try {
      await favoriteRepository.saveToFavorite(event.repo);
      emit(FavoriteSaveSuccessState(event.repo));
    } catch (err) {
      emit(FavoriteSaveErrorState(err.toString()));
    }
  }

  void _onFavoriteRemove(
      FavoriteRemoveEvent event,
      Emitter<FavoriteState> emit,
  ) async {
    try {
      await favoriteRepository.removeFromFavorite(event.repo);
    } catch (err) {
      print(err);
      emit(FavoriteErrorState(err.toString()));
    }
  }

}