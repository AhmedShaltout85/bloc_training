// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';



// class PostScreen extends StatelessWidget {
//   const PostScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text('Post Screen with Cubit',
//             style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<PostBoc, PostState>(
//         builder: (context, state) {
//           if (state is PostLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is PostLoaded) {
//             return ListView.builder(
//               itemCount: state.posts.length,
//               itemBuilder: (context, index) {
//                 final post = state.posts[index];
//                 return ListTile(
//                   title: Text(post.title),
//                   subtitle: Text(post.body),
//                 );
//               },
//             );
//           } else if (state is PostError) {
//             return Center(child: Text('Error: ${state.message}'));
//           } else {
//             return const SizedBox();
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blue,
//         onPressed: () {
//           context.read<PostCubit>().createPost(
//                 PostModel(
//                   title: 'new title',
//                   body: 'new body',
//                   userId: 1,
//                   id: 1,
//                 ),
//               );
//           log('POST ADDED ===============================================> POST ADDED');
//         },
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
// }
