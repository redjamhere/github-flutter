import 'package:routeam/src/models/reposotitory_model.dart';
import 'package:routeam/src/services/favorite_service.dart';

import '../services/services.dart';

class FavoriteRepository {
  final FavoriteService _favoriteService = FavoriteService();

  Future<List<RepositoryModel>> getFavoriteRepositories() async =>
    await _favoriteService.getFavoriteRepositories();

  Future<void> saveToFavorite(RepositoryModel r) async =>
    await _favoriteService.saveToFavorite(r);

  Future<void> removeFromFavorite(RepositoryModel r) async =>
    await _favoriteService.removeFromFavorite(r);

}