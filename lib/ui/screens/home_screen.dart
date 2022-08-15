import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/favorite_screen.dart';
import 'package:prueba_tec_leal/ui/screens/main_content/main_content.dart';
import 'package:prueba_tec_leal/ui/screens/recent_screen.dart';
import 'package:prueba_tec_leal/ui/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppStyle.black,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.gear))
          ],
        ),
        backgroundColor: AppStyle.black,
        body: TabBarView(
          controller: _tabController,
          children: const [
            MainContent(),
            FavoriteScreen(),
            RecentScreen(),
            SearchScreen()
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.white,
          labelColor: AppStyle.mainColor,
          indicatorColor: Colors.transparent,
          tabs: const [
            Tab(
                text: 'home',
                icon: Icon(
                  FontAwesomeIcons.personShelter,
                )),
            Tab(
                text: 'favorites',
                icon: Icon(
                  FontAwesomeIcons.heart,
                )),
            Tab(
                text: 'recent',
                icon: Icon(
                  FontAwesomeIcons.clockRotateLeft,
                )),
            Tab(
                text: 'search',
                icon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                )),
          ],
        ),
      );
}
