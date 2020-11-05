import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kandidat/src/blocs/user_detail_bloc.dart';
import 'package:kandidat/src/blocs/user_detail_bloc_provider.dart';
import 'package:kandidat/src/models/user_model.dart';

class UserDetail extends StatefulWidget {

  final int id;
  UserModel user;

  UserDetail({this.id, this.user});

  State<StatefulWidget> createState() {
    return UserDetailState(
      id: this.id,
      user: this.user,
    );
  }

}


class UserDetailState extends State<UserDetail> {

  final int id;
  UserModel user;

  UserDetailBloc bloc;

  UserDetailState({this.id, this.user});

  void didChangeDependencies() {
    bloc = UserDetailBlocProvider.of(context);
    bloc.fetchUserDetail(id);
    super.didChangeDependencies();
  }

  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('User Details')
        ),
        body: StreamBuilder(
          stream: bloc.user,
          builder: (context, AsyncSnapshot<UserModel> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.hasData) {
                final user = snapshot.data;
                return buildListView(user);
              } else {
                return CupertinoActivityIndicator();
              }
            } else {
              return CupertinoActivityIndicator();
            }
          },
        ),
    );

  }

  Widget buildListView(UserModel user) {
    this.user = user;

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(40),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.avatarURL),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),

        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Center(
            child: Text('${user.login}'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Center(
            child: user.bio != null
                ? Text('${user.bio}')
                : Text('n/a'),
          ),
        ),
        Divider(
          color: Colors.grey,
          height: 1,
          indent: 20,
          endIndent: 20,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 15,
                ),
                child: Icon(
                  Icons.account_circle,
                  size: 40,
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 5,
                    ),
                    child: Text('${user.login}'),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      'STAFF',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                ],
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.add_location,
            size: 40,
            color: Colors.black,
          ),
          title: user.location != null
              ? Text('${user.location}')
              : Text('n/a'),
        ),
        ListTile(
          leading: Icon(
            Icons.link,
            size: 40,
            color: Colors.black,
          ),
          title: user.blog != null
              ? Text('${user.blog}')
              : Text('n/a'),
        ),
      ],
    );
  }

}