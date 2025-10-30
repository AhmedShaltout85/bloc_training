import 'dart:developer';

import '../model/post_model.dart';
import '../repo/post_repo.dart';
import 'package:dio/dio.dart';

class ApiService extends PostRepository {
  late Dio dio;
  static final ApiService _instance = ApiService._internal();

  ApiService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    // Add interceptors for better logging and error handling
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      logPrint: (obj) => log(obj.toString()),
    ));
  }

  factory ApiService() {
    return _instance;
  }

  @override
  Future<PostModel> createPost(PostModel post) async {
    try {
      final response = await dio.post('posts', data: post.toJson());
      if (response.statusCode == 201) {
        return PostModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Failed to create post',
        );
      }
    } on DioException catch (e) {
      log('DioException in createPost: ${e.message}');
      rethrow;
    } catch (e) {
      log('Error in createPost: $e');
      rethrow;
    }
  }

  @override
  Future<void> deletePost(int id) async {
    try {
      final response = await dio.delete('posts/$id');
      if (response.statusCode == 200) {
        log('Post deleted successfully');
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Failed to delete post',
        );
      }
    } on DioException catch (e) {
      log('DioException in deletePost: ${e.message}');
      rethrow;
    } catch (e) {
      log('Error in deletePost: $e');
      rethrow;
    }
  }

  @override
  Future<PostModel> getPost(int id) async {
    try {
      final response = await dio.get('posts/$id');
      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Failed to get post',
        );
      }
    } on DioException catch (e) {
      log('DioException in getPostById: ${e.message}');
      rethrow;
    } catch (e) {
      log('Error in getPostById: $e');
      rethrow;
    }
  }

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get('posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Failed to get posts',
        );
      }
    } on DioException catch (e) {
      log('DioException in getPosts: ${e.message}');
      return [];
    } catch (e) {
      log('Error in getPosts: $e');
      return [];
    }
  }

  @override
  Future<PostModel> updatePost(PostModel post) async {
    try {
      final response = await dio.put('posts/${post.id}', data: post.toJson());
      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Failed to update post',
        );
      }
    } on DioException catch (e) {
      log('DioException in updatePost: ${e.message}');
      rethrow;
    } catch (e) {
      log('Error in updatePost: $e');
      rethrow;
    }
  }
}
