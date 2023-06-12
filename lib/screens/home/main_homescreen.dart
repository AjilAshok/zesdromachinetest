import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zesdromachinetes/screens/home/widgets/slider.dart';
import 'package:zesdromachinetes/screens/widgets/textwidget.dart';
import '../../constant/colors.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List list = [1, 2, 3, 4, 5, 6];
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: mainColor,
        title: Image.asset(
          'asset/images/moviesmodnew-Custom 1.png',
          height: 30,
        ),
        centerTitle: true,
        leading: Image.asset('asset/icons/drawericon.png'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('asset/icons/homesceen.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const TextHomeWidget(
                title: 'Trending this week',
              ),
              SizedBox(
                height: 15,
              ),
              Flexible(fit: FlexFit.loose, child: SliderScreen()),
              SizedBox(
                height: 10,
              ),
              const TextHomeWidget(title: 'Popular Movies'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: Text(index.toString()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        index.toString(),
                        style: GoogleFonts.inter(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const TextHomeWidget(title: 'Trending Now'),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: Text(index.toString()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        index.toString(),
                        style: GoogleFonts.inter(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const TextHomeWidget(title: 'Now Playing'),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: Text(index.toString()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        index.toString(),
                        style: GoogleFonts.inter(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextHomeWidget extends StatelessWidget {
  const TextHomeWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
    );
  }
}
