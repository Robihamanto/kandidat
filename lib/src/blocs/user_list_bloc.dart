import 'package:kandidat/src/models/user_model.dart';
import 'package:kandidat/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class UserListBloc {

  final _repository = Repository();
  final _users = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get users => _users;

  fetchUsers() async {
    final users = await _repository.fetchUsers();
    _users.sink.add(users);
  }

  dispose(){
    _users.close();
  }

}

final bloc = UserListBloc();