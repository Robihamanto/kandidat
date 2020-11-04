import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kandidat/src/blocs/user_list_bloc.dart';
import 'package:kandidat/src/models/user_model.dart';

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
          final login = snapshot.data[index].login;
          return Text(login);
        },
    );
  }

}