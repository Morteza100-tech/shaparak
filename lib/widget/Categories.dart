import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../data.dart';
import '../screen/category_items_screen.dart';
//import '../model/constants.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Swiper(
        itemCount: categories.length,
        itemWidth: MediaQuery.of(context).size.width * 0.85,
        itemHeight: MediaQuery.of(context).size.height * 0.75,
        layout: SwiperLayout.TINDER,
        // pagination: SwiperPagination(
        //   // builder: DotSwiperPaginationBuilder(
        //   //   activeSize: 14,
        //   //   space: 8,
        //   // ),
        // ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CategoryItemsScreen.routeName,
                  arguments: {
                    'title': categories[index].name,
                    'id': categories[index].id
                  });
            },
            child: Stack(
              children: [
                Column(
      
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // SizedBox(
                              //   height:
                              //       MediaQuery.of(context).size.height * 0.14,
                              // ),
                              Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontSize: 38,
                                  color: const Color(0xFF47455f),
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  categories[index].description,
                                  // style: Theme.of(context)
                                  //     .textTheme
                                  //     .subtitle
                                  //     .copyWith(fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage(categories[index].iconImage),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
