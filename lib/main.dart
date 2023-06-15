import 'package:api_call/nextpage.dart';
import 'package:api_call/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String getFirstLetter(GithubUser user) {
    if (user.login.isNotEmpty) {
      return user.login[0];
    } else {
      return '';
    }
  }

  List<GithubUser> users = [];

  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        users = value;
      });
    }).catchError((err) {
      print("on error: {err}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.star),
        title: const Text("Github Users"),
      ),
      body: users.isNotEmpty
          ? Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.8,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) =>
                  const SizedBox(
                    height: 10,
                  ),
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                          leading: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (_) => NextPage(user:users[index],),),);
                            },
                            child: CircleAvatar(
                              child: Text(getFirstLetter(users[index])),
                            ),
                          ),
                          title: Text(
                            users[index].login,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(users[index].htmlUrl)

                      ),
                    );
                  }),
            ),
          )
        ],
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<List<GithubUser>> fetchData() async {
    final url = "https://api.github.com/users";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = githubUsersFromJson(response.body);
      return data;
    } else {
      return [];
    }
  }
}
