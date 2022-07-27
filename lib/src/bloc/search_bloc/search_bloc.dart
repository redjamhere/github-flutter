import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:routeam/src/models/reposotitory_model.dart';

import '../../utils/utils.dart';
import '../../repositories/repositories.dart';

part 'search_state.dart';
part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  final FavoriteRepository favoriteRepository;

  SearchBloc({required this.searchRepository, required this.favoriteRepository})
      : super(const SearchInitialState()) {
    on<SearchRequested>(_onSearchRequested);
  }

  void _onSearchRequested(
    SearchRequested event,
    Emitter<SearchState> emit
  ) async {
    emit(const SearchLoadingState());
    try {
      final List<RepositoryModel> _result = await searchRepository.getRepositories(event.searchParam);
      final List<RepositoryModel> _favorites = await favoriteRepository.getFavoriteRepositories();
      for (int i = 0; i < _result.length; i++) {
        for(RepositoryModel r in _favorites) {
          _result[i].favorite = _result[i].id == r.id;
        }
      }
      emit(SearchSuccessState(_result));
    } catch (err) {
      emit(SearchErrorState(err.toString()));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
