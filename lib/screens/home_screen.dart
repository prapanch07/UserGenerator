import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:userapi/model/user_model.dart';
import 'package:userapi/screens/shimmer_screen.dart';
import 'package:userapi/services/user_api_service.dart';
import 'package:userapi/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  final String number;
  const HomeScreen({
    super.key,
    required this.number,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> userdetails = [];

  @override
  void initState() {
    _onrefresh();
    super.initState();
  }

  Future<void> _onrefresh() async {
    final data = await UserApiService().fetchusers(widget.number);
    setState(() {
      userdetails = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'User Details (${widget.number})',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            const Icon(
              Icons.light_mode,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Switch(
                  value: AdaptiveTheme.of(context).mode.isDark,
                  onChanged: (value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.dark_mode,
              size: 20,
            ),
            IconButton(
              onPressed: () => _onrefresh(),
              icon: const Icon(
                Icons.refresh_rounded, 
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: int.parse(widget.number),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemBuilder: (context, index) {
              final user = userdetails[index];
              final fullname =
                  "${user.name.title} ${user.name.first} ${user.name.last}";
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 7,
                ),
                child: userdetails.isEmpty
                    ? const ShimmerEffect()
                    : CustomCardWidget(
                        dp: user.dp.large,
                        name: fullname,
                        age: user.age.age,
                        phone: user.phone,
                        email: user.email,
                        username: user.logindetails.username,
                        password: user.logindetails.password,
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
