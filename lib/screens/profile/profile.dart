import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zesdromachinetes/constant/colors.dart';
import 'package:zesdromachinetes/screens/login/login.dart';
import '../widgets/textwidget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    signOut() async {
      await auth.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const TextWidget(text: 'Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('asset/icons/settings.png'),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [mainColor, secondColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      image: DecorationImage(
                        image: NetworkImage(
                            user?.photoURL ?? 'asset/images/Frame 16.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextWidget(text: user?.displayName ?? 'name'),
                  const Spacer(),
                  const Text(
                    'Edit Profile',
                    style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 12),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF9A9A9A),
                    size: 12,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Rank #322',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'XP 66/100',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF667ABF),
                          Color.fromARGB(255, 147, 155, 187)
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'View progress',
                    style: TextStyle(color: Color(0XFF0771C7), fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Wacth History',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 50,
              ),
              const ProfileOption(
                imageurl: 'asset/icons/refferal.png',
                title: 'Rewards & referrals',
              ),
              const SizedBox(
                height: 40,
              ),
              const ProfileOption(
                  imageurl: 'asset/icons/watch.png', title: 'Watch Later'),
              const SizedBox(
                height: 40,
              ),
              const ProfileOption(
                  imageurl: 'asset/icons/favaritores.png',
                  title: 'My favorites'),
              const SizedBox(
                height: 40,
              ),
              const ProfileOption(
                  imageurl: 'asset/icons/leaderborad.png',
                  title: 'Leaderboard'),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Are you want to logout"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () async {
                                print('33');
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.remove("email");
                                signOut();
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'LOGOUT',
                      style:
                          GoogleFonts.inter(color: Colors.white, fontSize: 14),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  const ProfileOption({super.key, required this.imageurl, required this.title});
  final String imageurl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imageurl),
        const SizedBox(
          width: 15,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 15,
        )
      ],
    );
  }
}
