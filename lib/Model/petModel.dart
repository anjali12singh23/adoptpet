import 'package:flutter/material.dart';

class PetsModel {
  int id;
  String name;
  String breed;
  String image;
  String age;
  String sex;
  String price;
  Color color;
  String description;
  String status;

  PetsModel({
    required this.id,
    required this.image,
    required this.name,
    required this.breed,
    required this.sex,
    required this.age,
    required this.price,
    required this.color,
    required this.description,
    required this.status,
  });
}

List<PetsModel> cats = [
  PetsModel(
    id: 1,
    name: 'Mono LaMi',
    breed: 'British Shorthair cats',
    image: 'assets/images/cat3.png',
    age: "1",
    price: "10",
    sex: "Female",
    color: const Color(0xffC1B7B1),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',

  ),
  PetsModel(
    id: 2,
    name: 'Amila Marko',
    breed: 'LaPerm cats',
    image: 'assets/images/cat2.png',
    age: "2",
    price: "40",
    sex: "male",
    color: const Color(0xffD7BF9D),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
  PetsModel(
    id: 3,
    name: 'Yon lee',
    breed: 'Persian cat',
    image: 'assets/images/cat1.png',
    age: "3 ",
    price: "50",
    sex: "Female",
    color: const Color(0xffB1D1FF),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
  PetsModel(
    id: 4,
    name: 'Yon lee',
    breed: 'Persian cat',
    image: 'assets/images/cat4.png',
    age: "3.6",
    price: "20",
    sex: "male",
    color: const Color(0xffB1D1FF),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: 'adopted',
  ),
];
List<PetsModel> dogs = [
  PetsModel(
    id: 1,
    name: 'Max',
    breed: 'Labrador Retriever',
    image: 'assets/images/dog1.png',
    age: " 1",
    price: "30",
    sex: "Dog",
    color: const Color(0xffC1B7B1),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
  PetsModel(
    id: 2,
    name: 'Bella',
    breed: 'Golden Retriever',
    image: 'assets/images/dog2.png',
    age: " 2",
    price: "25",
    sex: "Dog",
    color: const Color(0xffD7BF9D),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
  PetsModel(
    id: 3,
    name: 'Charlie',
    breed: 'German Shepherd',
    image: 'assets/images/dog3.png',
    age: " 2.5",
    price: "35",
    sex: "Dog",
    color: const Color(0xffB1D1FF),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: 'adopted',
  ),
  PetsModel(
    id: 4,
    name: 'Daisy',
    breed: 'Beagle',
    image: 'assets/images/dog4.png',
    age: "2.5",
    price: "32",
    sex: "Dog",
    color: const Color(0xffC1B7B1),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
  PetsModel(
    id: 5,
    name: 'Luna',
    breed: 'Siberian Husky',
    image: 'assets/images/dog5.png',
    age: " 2.5",
    price: "25",
    sex: "Dog",
    color: const Color(0xffB1D1FF),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
];
List<PetsModel> birds = [
  PetsModel(
    id: 1,
    name: 'Charlie',
    breed: 'African Grey Parrot',
    image: 'assets/images/bird1.png',
    age: " 1",
    price: "43",
    sex: "bird",
    color: const Color(0xffC1B7B1),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
  PetsModel(
    id: 2,
    name: 'Rio',
    breed: 'Scarlet Macaw',
    image: 'assets/images/bird2.png',
    age: "1",
    price: "56",
    sex: "Bird",
    color: const Color(0xffC1B7B1),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
  PetsModel(
    id: 3,
    name: 'Sunny',
    breed: 'Cockatiel',
    image: 'assets/images/bird3.png',
    age: " 1",
    price: " 34",
    sex: "Bird",
    color: const Color(0xffB1D1FF),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: '',
  ),
  PetsModel(
    id: 4,
    name: 'Blue',
    breed: 'Gold Macaw',
    image: 'assets/images/bird4.png',
    age: " 2",
    price: "20",
    sex: "bird",
    color: const Color(0xffC1B7B1),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: 'adopted',
  ),
];
List<PetsModel> other = [
  PetsModel(
    id: 4,
    name: 'Yon lee',
    breed: 'Persian cat',
    image: 'assets/images/cat4.png',
    age: "3.6",
    price: "43",
    sex: "male",
    color: const Color(0xffB1D1FF),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: 'adopted',
  ),
  PetsModel(
    id: 2,
    name: 'Charlie',
    breed: 'German Shepherd',
    image: 'assets/images/dog3.png',
    age: " 2.5",
    price: "32",
    sex: "Dog",
    color: const Color(0xffB1D1FF),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: 'adopted',
  ),
  PetsModel(
    id: 3,
    name: 'Blue',
    breed: 'Gold Macaw',
    image: 'assets/images/bird4.png',
    age: " 2",
    price: "20",
    sex: "bird",
    color: const Color(0xffC1B7B1),
    description:
    "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    status: 'adopted',
  )
];

List<String> categoryList = [
  'Cats',
  'Dogs',
  'Birds',
  'History'
];