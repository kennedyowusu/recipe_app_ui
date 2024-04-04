import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constant/theme/app_color.dart';
import 'package:recipe_app/controller/save_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/widget/custom_loader.dart';

class RecipeItem extends StatelessWidget {
  final RecipeModel recipe;
  RecipeItem({super.key, required this.recipe});

  final SaveRecipeController saveRecipe = Get.put(SaveRecipeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 220,
      child: Stack(
        children: [
          Container(
            height: 2200,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(recipe.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 8,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    recipe.category,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              recipe.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.white),
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Obx(
                            () => saveRecipe.isLoading.value
                                ? const CustomLoader() // Display loader if isLoading is true
                                : IconButton(
                                    onPressed: () async {
                                      saveRecipe.setLoading(
                                          true); // Set loading to true when saving starts
                                      if (saveRecipe.savedRecipes
                                          .contains(recipe)) {
                                        saveRecipe.removeRecipe(recipe);
                                        debugPrint('Remove Recipe');
                                      } else {
                                        // Simulate async operation with Future.delayed
                                        await Future.delayed(
                                          const Duration(
                                            seconds: 2,
                                          ),
                                        ); // Replace with your actual saving logic
                                        saveRecipe.saveRecipe(recipe);
                                        debugPrint('Save Recipe');
                                      }
                                      saveRecipe.setLoading(
                                          false); // Set loading to false when saving completes
                                    },
                                    icon: Icon(
                                      saveRecipe.savedRecipes.contains(recipe)
                                          ? Icons.delete_outline
                                          : Icons.bookmark_outline,
                                      color: saveRecipe.savedRecipes
                                              .contains(recipe)
                                          ? AppColor.primaryColor
                                          : Colors.green,
                                      size: 20,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
