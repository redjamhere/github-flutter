part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchErrorState extends SearchState {
  final String error;
  const SearchErrorState(this.error) : super ();
}

class SearchLoadingState extends SearchState {
  const SearchLoadingState() : super();
}

class SearchSuccessState extends SearchState {
  final List<RepositoryModel> result;
  const SearchSuccessState(this.result) : super ();

  List<RepositoryModel> get repositories => result;
}

class SearchEmptyState extends SearchState {
  const SearchEmptyState() : super();
}

class SearchInitialState extends SearchState {
  const SearchInitialState() : super();
}

