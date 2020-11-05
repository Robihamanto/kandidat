import 'package:kandidat/src/models/user_model.dart';
import 'package:kandidat/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class UserDetailBloc {

  final _repository = Repository();
  final _user = PublishSubject<UserModel>();

  Stream<UserModel> get user => _user;

  fetchUserDetail(int id) async {
    UserModel user = await _repository.fetchUser(id);
  }

  dispose() {
    _user.close();
  }

}

final bloc = UserDetailBloc();