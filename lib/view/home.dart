import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constant/theme/app_color.dart';
import 'package:recipe_app/data/data.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/widget/recipe_item.dart';
import 'package:recipe_app/controller/search_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final SearchAppController searchController = Get.put(SearchAppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, Kobicypher",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColor.primaryColor),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColor.backgroundGray,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "What do you want to cook today?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.backgroundGray,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.search),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        searchController.searchHistory.add(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Search for recipes",
                        hintStyle: TextStyle(
                          color: AppColor.blackGrey.withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              decoration: BoxDecoration(
                color: AppColor.blackGrey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Image(
                image: AssetImage("assets/images/vodafone.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Recipes",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 280,
              child: ListView.separated(
                itemCount: trendingRecipes.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final RecipeModel recipe = trendingRecipes[index];
                  if (searchController.searchHistory.isNotEmpty &&
                      !recipe.search(searchController.searchHistory.last)) {
                    return const SizedBox
                        .shrink(); // Hide the item if it doesn't match the search query
                  }
                  return RecipeItem(recipe: recipe);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Recipes",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 280,
              child: ListView.separated(
                itemCount: latestRecipes.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final RecipeModel recipe = latestRecipes[index];
                  if (searchController.searchHistory.isNotEmpty &&
                      !recipe.search(searchController.searchHistory.last)) {
                    return const SizedBox
                        .shrink(); // Hide the item if it doesn't match the search query
                  }
                  return RecipeItem(recipe: recipe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
