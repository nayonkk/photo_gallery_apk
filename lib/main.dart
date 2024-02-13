import 'package:flutter/material.dart';
import 'package:photo_gallery_apk/full_images/full_images.dart';
import 'package:photo_gallery_apk/model/post.dart';
import 'package:photo_gallery_apk/remote_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 25),
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              color: Colors.green,
              foregroundColor: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Post>? posts;
  var isloaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await Remote_service().getPosts();
    if (posts != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: Visibility(
        visible: isloaded,
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              var titles = posts![index];
              var colorss = posts![index].url;

              return ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => full_images()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(colorss))),
                  ),
                ),
                title: Text(
                  titles.title,
                  style: TextStyle(fontSize: 18),
                ),
              );
            }),
        replacement: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
