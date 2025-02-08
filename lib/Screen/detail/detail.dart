import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import '../../Model/petModel.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.pets});
  final PetsModel pets;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 3));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.pets.color,
        leading: BackButton(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: size.height / 2,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: widget.pets.color,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Hero(
                            tag: widget.pets.image,
                            child: Image.asset(
                              widget.pets.image,
                              height: size.height / 3,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ageSexOrigin(widget.pets.age, "Age"),
                              ageSexOrigin(widget.pets.sex, "Sex"),
                              ageSexOrigin("${widget.pets.price}\$", "Price"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pets.name,
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text(
                        widget.pets.description,
                        style: const TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: size.width,
                  height: size.height / 12,
                  child: InkWell(
                    onTap: () {
                      if (widget.pets.status != 'adopted') {
                        _showAdoptionDialog(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${widget.pets.name} already adopted!')),
                        );
                      }
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: widget.pets.color,
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Adopt Me',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -1.5,
              emissionFrequency: 0.02,
              numberOfParticles: 30,
              shouldLoop: false,
            ),
          ),
        ],
      ),
    );
  }

  Container ageSexOrigin(value, name) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black45,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }

  void _showAdoptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adopt ${widget.pets.name}'),
          content: TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Enter your name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adopt'),
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  setState(() {
                    widget.pets.status = 'Adopted by ${_nameController.text}';
                  });
                  Navigator.of(context).pop();
                  _confettiController.play();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${widget.pets.name} has been adopted by ${_nameController.text.toString().toUpperCase()}')),
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter your name.')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
