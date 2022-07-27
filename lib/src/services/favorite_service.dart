import 'dart:convert';
import 'package:routeam/src/models/reposotitory_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {

  Future<void> saveToFavorite(RepositoryModel repository) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedRepos = prefs.getStringList('repos')?? [];
    savedRepos.add(json.encode(repository.toJson()));
    await prefs.setStringList("repos", savedRepos);
  }

  Future<List<RepositoryModel>> getFavoriteRepositories() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedRepos = prefs.getStringList('repos')?? [];
    return savedRepos.map((e) => RepositoryModel.fromJson(json.decode(e))).toList();
  }

  Future<void> removeFromFavorite(RepositoryModel repo) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedReposStr = prefs.getStringList('repos')?? [];
    List<RepositoryModel> savedRepos = savedReposStr.map((e) => RepositoryModel.fromJson(json.decode(e))).toList();
    savedRepos.removeWhere((element) => element.id == repo.id);
    savedReposStr = savedRepos.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('repos', savedReposStr);
  }

}