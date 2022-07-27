import 'package:routeam/src/models/reposotitory_model.dart';

import '../services/services.dart';

class SearchRepository {
  final SearchService _searchService = SearchService();

  Future<List<RepositoryModel>> getRepositories(String param) async =>
      await _searchService.getRepositories(param);
}