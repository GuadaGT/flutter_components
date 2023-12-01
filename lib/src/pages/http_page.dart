import 'package:flutter/material.dart';
import 'package:flutter_components/src/Providers/blog_provider.dart';
import 'package:flutter_components/src/models/blog.dart';

class HttpPage extends StatefulWidget {
  BlogProvider http = BlogProvider();
  HttpPage({super.key});

@override
  State <HttpPage> createState() => _HttpPageState();
}

  class _HttpPageState extends State <HttpPage>{
    late final Future<List<Blog>> blogsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    blogsFuture = widget.http.fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peticiones HTTP'),
      ),
      body: FutureBuilder(
        future: blogsFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Blog>> snapshot)
        {
            if(snapshot.hasData && snapshot.data != null)
            {
              List<Blog> blogs = snapshot.data!;

              return ListView(
                children: blogs.map((Blog blog) => ListTile(
                  title: Text(blog.title!),
                )).toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      )
    );
  }
}
  