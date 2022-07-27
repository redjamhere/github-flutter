import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:routeam/src/models/reposotitory_model.dart';

class SearchService {

  Future<List<RepositoryModel>> getRepositories(String param) async {
    final response = await http.get(Uri.parse('https://api.github.com/search/repositories?q=$param'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['items'];
      return data.map((e) => RepositoryModel.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching repositories');
    }
  }

}