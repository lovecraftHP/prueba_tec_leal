import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';
import 'package:prueba_tec_leal/ui/screens/main_content/widget/movie_popular_list.dart';
import 'package:prueba_tec_leal/ui/widgets/title_text.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppStyle.black,
      body: CustomScrollView(
        slivers: [
          const TitleText(title: 'Popular'),
          SliverList(
            delegate: SliverChildListDelegate([
              const MoviePopularList(),
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
          SliverList(delegate: SliverChildListDelegate([]))
        ],
      ));
}
