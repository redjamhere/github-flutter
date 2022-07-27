part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchRequested extends SearchEvent {
  const SearchRequested(this.searchParam);
  final String searchParam;

  @override
  List<Object?> get props => [searchParam];
}