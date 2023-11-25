import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:userapi/model/user_model.dart';

class UserApiService {
  Future<List<User>> fetchusers(endpointnumber) async {
    const baseurl = "https://randomuser.me/api/?results=";

    final endpoint = endpointnumber;

    final responsurl = baseurl + endpoint;

    final url = Uri.parse(responsurl);

    final respons = await http.get(url);

    final json = jsonDecode(respons.body);

    final result = json['results'] as List<dynamic>;

    final userssd = result.map(
      (e) {
        final name = UsersName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last'],
        );

        final profilepic = UsersImage(
          large: e['picture']['large'],
          medium: e['picture']['medium'],
          thumbnail: e['picture']['thumbnail'],
        );

        final age = UsersAge(
          date: e['dob']['date'].toString(),
          age: e['dob']['age'].toString(),
        );

        final logindetails = UsersLoginDetails(
          username: e['login']['username'],
          password: e['login']['password'],
        );

        return User(
          dp: profilepic,
          name: name,
          age: age,
          phone: e['phone'],
          email: e['email'],
          logindetails: logindetails,
        );
      },
    ).toList();

    return userssd;
  }
}
