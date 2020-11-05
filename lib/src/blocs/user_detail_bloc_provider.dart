import 'package:flutter/cupertino.dart';
import 'package:kandidat/src/blocs/user_detail_bloc.dart';

class UserDetailBlocProvider extends InheritedWidget {

  final UserDetailBloc bloc;

  UserDetailBlocProvider({Key key, Widget child})
      : bloc = UserDetailBloc(),
        super(key: key, child: child);


  bool updateShouldNotify(_) => true;


  static UserDetailBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(UserDetailBlocProvider)
        as UserDetailBlocProvider).bloc;
  }

}