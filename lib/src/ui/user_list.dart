import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kandidat/src/blocs/user_detail_bloc_provider.dart';
import 'package:kandidat/src/blocs/user_list_bloc.dart';
import 'package:kandidat/src/models/user_model.dart';
import 'package:kandidat/src/ui/user_detail.dart';

class UserList extends StatefulWidget {

  State<StatefulWidget> createState() {
    return UserListState();
  }

}


class UserListState extends State<UserList> {

  void initState() {
    super.initState();
    bloc.fetchUsers();
  }

  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Users List'),
      ),
      body: StreamBuilder(
        stream: bloc.users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text('Something happend, could not retrieve data');
          }

          return Center(
              child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<UserModel>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final user = snapshot.data[index];
          final login = user.login;
          final avatarURL = user.avatarURL;
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text(login),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(avatarURL),
              backgroundColor: Colors.transparent,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              openUserDetail(user, index);
            },
          );
        },
    );
  }

  openUserDetail(UserModel user, int index) {
    final page = UserDetailBlocProvider(
      child: UserDetail(
        id: user.id,
        user: user,
      ),
    );

    Navigator.push(
        context,
        MaterialPageRoute(builder:(context) {
          return page;
        }),
    );
  }

}









