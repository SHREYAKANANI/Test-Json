import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Users/User%20Details.dart';
import 'package:flutter_app/network.dart';

import '../post.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  // ignore: deprecated_member_use, non_constant_identifier_names
  List<Post> _Posts = List<Post>();

  // ignore: deprecated_member_use, non_constant_identifier_names
  List<Post> _PostsDisplay = List<Post>();

  bool _isLoading = true;

  @override
  void initState() {
    fetchPost().then((value) {
      setState(() {
        _isLoading = false;
        _Posts.addAll(value);
        _PostsDisplay = _Posts;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        if (!_isLoading) {
          return index == 0 ? _searchBar() : _ListItem(index - 1);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
        itemCount: _PostsDisplay.length + 1,
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search,
            size: 30,
            color: Colors.black87,

          ),
          hintText: 'Search name.....',

        ),

        onChanged: (text) {
          text = text.toLowerCase();
          text = text.toUpperCase();
          setState(() {
            // ignore: non_constant_identifier_names
            _PostsDisplay = _Posts.where((Post) {
              // ignore: non_constant_identifier_names
              var PostTitle = Post.name.toLowerCase();
              return PostTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _ListItem(index) {
    return Card(
        child: InkWell(

            child: Padding(
              padding: EdgeInsets.only(
                  top: 32, bottom: 32, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                      _PostsDisplay[index].name,

                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)
                  ),

                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserDetails();
              }));
            }

        ));
  }
}



