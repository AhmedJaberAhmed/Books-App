import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


 import '../../../../../Core/utils/styles.dart';
import '../../../../splash/presentation/view_model/views/widgets/customAppBar.dart';
import 'BestSellerListView.dart';
import 'FeaturedBooksListView.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Newset Books",
                  style: Styles.titleMeaduim,
                ),
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
