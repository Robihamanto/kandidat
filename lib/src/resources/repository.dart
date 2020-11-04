import 'package:kandidat/src/models/user_model.dart';
import 'package:kandidat/src/resources/github_api_provider.dart';

class Repository {
  final githubApiProvider = GithubApiProvider();

  Future<List<UserModel>> fetchUsers() => githubApiProvider.fetchUsers();
}