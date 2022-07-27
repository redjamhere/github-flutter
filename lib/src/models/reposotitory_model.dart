// описания моделей данных

class RepositoryModel {
  final int id;
  final String fullname;
  final String url;
  final int watchers;
  final int stargazers;
  final RepositoryAuthorModel author;
  bool favorite;

  RepositoryModel({
    required this.id,
    required this.fullname,
    required this.url,
    required this.watchers,
    required this.stargazers,
    required this.author,
    this.favorite = false
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> data) => RepositoryModel(
      id: data['id'],
      fullname: data['full_name'],
      url: data['svn_url'],
      watchers: data['watchers_count'],
      stargazers: data['stargazers_count'],
      author: RepositoryAuthorModel.fromJson(data['owner']),
      favorite: data['favorite']?? false
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullname,
    'svn_url': url,
    'watchers_count': watchers,
    'stargazers_count': stargazers,
    'owner': author.toJson(),
    'favorite': favorite
  };

  @override
  String toString() {
    return super.toString();
  }
}


class RepositoryAuthorModel {
  final int id;
  final String name;
  final String profileUrl;
  final String avatarUrl;

  const RepositoryAuthorModel({
    required this.id,
    required this.name,
    required this.profileUrl,
    required this.avatarUrl
  });

  factory RepositoryAuthorModel.fromJson(Map<String, dynamic> data) => RepositoryAuthorModel(
      id: data['id'],
      name: data['login'],
      profileUrl: data['html_url'],
      avatarUrl: data['avatar_url']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'login': name,
    'html_url': profileUrl,
    'avatar_url': avatarUrl
  };

  @override
  String toString() => "$id: $name";
}