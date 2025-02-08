import 'package:adoptpet/Model/petModel.dart';
import 'package:flutter/material.dart';
import '../detail/detail.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int selectedIndex = 0;
  String searchQuery = "";
  List<List<PetsModel>> categories = [cats, dogs, birds, other];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            const SizedBox(width: 8),
            const Text(
              "Hi, Abin",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Adopt\nyour pet's here!",
                  style: TextStyle(height: 1.1, fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              searchBar(),
              categorySelection(),
              petDetailSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value.toLowerCase();
          });
        },
        decoration: InputDecoration(
          hintText: "Search pets...",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget categorySelection() {
    return Container(
      margin: EdgeInsets.only(right: 30),
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Container(
                height: 80,
                width: 75,
                decoration: BoxDecoration(
                  color: selectedIndex == index ? const Color(0xffFF9166) : const Color(0xffFF9166).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    if (selectedIndex == index)
                      BoxShadow(color: const Color(0xffFF9166).withOpacity(0.5), blurRadius: 12, spreadRadius: 1),
                  ],
                ),
                child: Center(
                  child: Text(
                    categoryList[index],
                    style: TextStyle(
                      color: selectedIndex == index ? Colors.white : Colors.amber[900],
                      fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget petDetailSection() {
    List<PetsModel> filteredPets = categories[selectedIndex]
        .where((pet) => pet.name.toLowerCase().contains(searchQuery)||pet.age.toLowerCase().contains(searchQuery)  || pet.sex.toLowerCase().compareTo(searchQuery) == 0)
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SizedBox(
        height: 400,
        child: ListView.builder(
          itemCount: filteredPets.length,
          itemBuilder: (context, index) {
            PetsModel pet = filteredPets[index];
            return GestureDetector(
              onTap: () {

                if(pet.status != 'adopted'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailScreen(pets: pet)),
                  );

                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${pet.name} already adopted!')),
                  );
                }


              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              decoration: BoxDecoration(color: pet.color, borderRadius: BorderRadius.circular(20)),
                              height: 230,
                            ),
                          ),
                          SizedBox(
                            height: 230,
                            child: Center(
                              child: Hero(
                                tag: pet.image,
                                child: Image.asset(pet.image, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: pet.color.withOpacity(0.2),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(pet.name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
                                const SizedBox(height: 5),
                                Text(pet.breed, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                                Row(
                                  children: [
                                    Text(pet.sex, style: const TextStyle(fontSize: 15)),
                                    Text(", ${pet.age} year old", style: const TextStyle(fontSize: 15)),
                                  ],
                                ),
                                pet.status != 'adopted'?SizedBox():Text(pet.status.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),

                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
