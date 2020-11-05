import 'package:flutter/cupertino.dart';
import 'package:kandidat/src/blocs/user_detail_bloc.dart';

class UserDetailProvider extends InheritedWidget {

  final UserDetailBloc bloc;

  UserDetailProvider({Key key, Widget child})
      : bloc = UserDetailBloc(),
        super(key: key, child: child);


  bool updateShouldNotify(_) => true;


  static UserDetailBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(UserDetailProvider)
        as UserDetailProvider).bloc;
  }

}