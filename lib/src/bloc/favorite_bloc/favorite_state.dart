part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FavoriteErrorState extends FavoriteState {
  final String error;
  const FavoriteErrorState(this.error): super();
}

class FavoriteLoadingState extends FavoriteState {
  const FavoriteLoadingState() : super();
}

class FavoriteSuccessState extends FavoriteState {
  final List<RepositoryModel> result;
  const FavoriteSuccessState(this.result) : super();
}

class FavoriteEmptyState extends FavoriteState {
  const FavoriteEmptyState() : super();
}

class FavoriteInitialState extends FavoriteState {
  const FavoriteInitialState() : super();
}

class FavoriteSaveSuccessState extends FavoriteState {
  final RepositoryModel savedRepo;
  const FavoriteSaveSuccessState(this.savedRepo) : super();
}

class FavoriteSaveErrorState extends FavoriteState {
  final String error;
  const FavoriteSaveErrorState(this.error) : super();
}