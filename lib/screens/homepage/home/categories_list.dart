import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:mono/models/category_model.dart';
import 'package:mono/provider/category_provider.dart';
import 'package:mono/utilites/constants.dart';
import 'package:mono/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (context, catProvider, child) => ConditionalBuilder(
              condition: catProvider.categoryModel != null,
              builder: (context) => Container(
                height: 80,
                child: ListView.builder(
                    itemCount: catProvider.categoryModel!.data!.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          height: 80,
                          width: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                categoryList[index].toString(),
                                scale: 2,
                              ),
                              //Space
                              SizedBox(
                                height: 6,
                              ),
                              //
                              Row(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: CustomText(
                                        title: catProvider.categoryModel!.data![index].name,
                                        fontSize: 14,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              fallback: (context) => const Center(child: CircularProgressIndicator(),),
            ));
  }
}
