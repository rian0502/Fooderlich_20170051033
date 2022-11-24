import 'dart:convert';
import 'package:aplikasi_3/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class RecipeService{
  static const String URL = 'https://uji.fmipa.unila.ac.id/api-test/recipes.json';

  static Future<List<SimpleRecipe>> getRecipes() async{
    var response = await http.get(Uri.parse(URL));
    if(response.statusCode == 200){
      final Map<String, dynamic> json = jsonDecode(response.body);
      if(json['recipes'] != null){
        final recipes = <SimpleRecipe>[];
        json['recipes'].forEach((recipe){
          recipes.add(SimpleRecipe.fromJson(recipe));
        });
        return recipes;
      }else{
        return [];
      }
    }else{
      throw Exception('Gagal mendapatkan data');
    }
  }

  static Future<List<SimpleRecipe>> getRecipesDio() async{
    var dio = Dio();
    var response = await dio.get(URL);
    if(response.statusCode == 200){
      final Map<String, dynamic> json = jsonDecode(response.toString());
      if(json['recipes'] != null){
        final recipes = <SimpleRecipe>[];
        json['recipes'].forEach((recipe){
          recipes.add(SimpleRecipe.fromJson(recipe));
        });
        return recipes;
      }else{
        return [];
      }
    }else{
      throw Exception('Gagal mendapatkan data');
    }
  }

}