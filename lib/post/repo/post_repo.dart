import '../model/post_model.dart';

abstract class PostRepository {
  // Fetches a list of posts
  Future<List<PostModel>> getPosts();

  // Fetches a single post by ID
  Future<PostModel> getPost(int id);

  // Creates a new post
  Future<PostModel> createPost(PostModel post);

  // Updates an existing post
  Future<PostModel> updatePost(PostModel post);
  // Deletes a post by ID
  Future<void> deletePost(int id);
}
