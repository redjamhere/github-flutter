part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class FavoriteSaveEvent extends FavoriteEvent {
  const FavoriteSaveEvent(this.repo);
  final RepositoryModel repo;

  @override
  List<Object?> get props => [repo];
}

class FavoriteRemoveEvent extends FavoriteEvent {
  const FavoriteRemoveEvent(this.repo);
  final RepositoryModel repo;

  @override
  List<Object?> get props => [repo];
}

class FavoriteGetEvent extends FavoriteEvent {
  const FavoriteGetEvent();

  @override
  List<Object?> get props => [];
}

class FavoriteUpdateEvent extends FavoriteEvent {
  const FavoriteUpdateEvent();

  @override
  List<Object?> get props => [];
}