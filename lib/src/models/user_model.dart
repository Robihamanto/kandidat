class UserModel {

  String _login;
  int _id;
  String _avatarURL;
  String _url;
  String _type;
  bool _siteAdmin;
  String _name;
  String _company;
  String _location;
  String _bio;
  int _followers;
  int _following;

  UserModel.fromJSON(Map<String, dynamic> parsedJSON) {
    _login = parsedJSON['login'];
    _id = parsedJSON['id'];
    _avatarURL = parsedJSON['avatar_url'];
    _url = parsedJSON['url'];
    _type = parsedJSON['type'];
    _siteAdmin = parsedJSON['site_admin'];
    _name = parsedJSON['name'];
    _company = parsedJSON['company'];
    _location = parsedJSON['location'];
    _bio = parsedJSON['bio'];
    _followers = parsedJSON['followers'];
    _following = parsedJSON['following'];
  }


  String  get login => _login;
  int     get id => _id;
  String  get avatarURL => _avatarURL;
  String  get url => _url;
  String  get type => _type;
  bool    get siteAdmin => _siteAdmin;
  String  get name => _name;
  String  get company => _company;
  String  get location => _location;
  String  get bio => _bio;
  int     get followers => _followers;
  int     get following => _following;


}