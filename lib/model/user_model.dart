class User {
  final String phone;

  final String email;
  final UsersName name;
  final UsersImage dp;
  final UsersAge age;
  final UsersLoginDetails logindetails;

  User({
    required this.phone,
    required this.email,
    required this.name,
    required this.dp,
    required this.age,
    required this.logindetails,
  });
}

// names of user
class UsersName {
  final String title;
  final String first;
  final String last;

  UsersName({
    required this.title,
    required this.first,
    required this.last,
  });
}

// images of user
class UsersImage {
  final String large;
  final String medium;
  final String thumbnail;

  UsersImage({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });
}
 
// age of user

class UsersAge {
  final String date;
  final String age;

  UsersAge({ 
    required this.date,
    required this.age, 
  });
}

// login details

class UsersLoginDetails {
  final String username;
  final String password;

  UsersLoginDetails({
    required this.username,
    required this.password,
  });
}
