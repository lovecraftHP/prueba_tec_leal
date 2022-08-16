import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba_tec_leal/core/cubit/movie_recommendation_cubit.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/main_content/widget/movie_popular_list.dart';
import 'package:prueba_tec_leal/ui/screens/main_content/widget/movie_recommendations.dart';
import 'package:prueba_tec_leal/ui/widgets/title_text.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppStyle.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false);
              },
              icon: const Icon(FontAwesomeIcons.gear))
        ],
      ),
      backgroundColor: AppStyle.black,
      body: CustomScrollView(
        slivers: [
          const TitleText(title: 'Popular'),
          SliverList(
            delegate: SliverChildListDelegate([
              const MoviePopularList(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'See All ',
                      style:
                          TextStyle(color: AppStyle.mainColor, fontSize: 17.sp),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 17.sp,
                      color: AppStyle.mainColor,
                    )
                  ],
                ),
              )
            ]),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Divider(
              color: Colors.grey.shade700,
            ),
          )),
          const TitleText(title: 'Recommendations'),
          SliverList(
              delegate: SliverChildListDelegate([const MovieRecommendations()]))
        ],
      ));
}
