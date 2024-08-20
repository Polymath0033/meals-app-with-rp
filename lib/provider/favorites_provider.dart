import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal.dart';

class FavoritesMealNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealNotifier() : super([]);
  bool toggleFavorite(Meal meal) {
    // final isExisting = state.contains(meal);
    // if (isExisting) {
    //   state = List.from(state)..remove(meal);
    // } else {
    //   state = List.from(state)..add(meal);
    // }
    final favoritesMeal = state.contains(meal);
    if (favoritesMeal) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesMealNotifier, List<Meal>>((ref) {
  return FavoritesMealNotifier();
});
