import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFeature extends StatefulWidget {
  const SearchFeature({super.key});

  @override
  State<SearchFeature> createState() => _SearchFeatureState();
}

class _SearchFeatureState extends State<SearchFeature> {
  List<Map> products = [
    {
      'Image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlQtuVgTTsVZyTu7RVZam9cT6ubt5dPyeKXw&s',
      'title': 'Man Shoes',
      'price': 160,
    },
    {
      'Image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmZhgHouDblRtO9Qn0HnQba15p7jOD3CKqLw&s',
      'title': 'Women Cream',
      'price': 70,
    },
    {
      'Image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsqW8foZVrpQNneT2aYMe_P9UC_4n0raDMfA&s',
      'title': 'Labtop',
      'price': 450,
    },
    {
      'Image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKMvib-WV_UxBzzcg_RCsF5GDC9_OSG2eFPg&s',
      'title': 'Old-Man-Camera',
      'price': 34,
    },
    {
      'Image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQpD4O-zWOznNZNTdV42_I0V02bvlVsARfUg&s',
      'title': 'vegetables',
      'price': 704,
    },
  ];

  List<Map> filterList = [];

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    filterList = products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _searchFunction(String keyWord) {
      setState(() {
        filterList = products.where((product) {
          final title = product['title'].toString().toLowerCase();
          final input = keyWord.toLowerCase().trim();
          return title.contains(input);
        }).toList();
      });
    }

    void _filterPrice() {
      setState(() {
        filterList = List<Map>.from(products);
        filterList.sort((a, b) => b['price'].compareTo(a['price']));
      });
    }

    void _filterAlpha() {
      setState(() {
        filterList = List<Map>.from(products);
        filterList.sort((a, b) => a['title'].compareTo(b['title']));
      });
    }

    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Filtter & Search ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller,
                onChanged: _searchFunction,
                cursorColor: Colors.black,
                cursorHeight: 20,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  prefixIcon: Icon(CupertinoIcons.search),
                  prefixIconColor: Colors.white,
                  suffixIcon:
                      _controller.text.isNotEmpty && _controller.text != ''
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _searchFunction('');
                              _controller.text = '';
                            });
                          },
                          icon: Icon(CupertinoIcons.clear, size: 18),
                        )
                      : SizedBox.shrink(),
                  suffixIconColor: Colors.red.shade500,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black26,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _searchFunction('');
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _searchFunction('Man');
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Men',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  GestureDetector(
                    onTap: () {
                      _searchFunction('Women');
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Women',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: _filterPrice,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.filter_list_alt),
                            Text(
                              'High-Low',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _filterAlpha,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.filter_list_alt),
                            Text(
                              'A - Z',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filterList = List<Map>.from(products);
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.clear),
                            Text(
                              'Clear',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Column(
                children: List.generate(filterList.length, (index) {
                  final product = filterList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        '${product['title']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        '${product['price'].toString()}\$',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: Image.network(
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                          '${product['Image']}',
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
