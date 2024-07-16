import 'package:flutter/material.dart';
import '../../../modal/home_card_modal/home_card_modal.dart';
import '../../../modal/home_card_modal/page_ transitions.dart';
import '../../detail_screen/detail_screen.dart';

class PlanetCard extends StatefulWidget {
  final Planetcardmodal planetCardModal;

  PlanetCard({required this.planetCardModal});

  @override
  _PlanetCardState createState() => _PlanetCardState();
}

class _PlanetCardState extends State<PlanetCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: -15.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 350,
          width: 300,
          margin: EdgeInsets.fromLTRB(16, 100, 16, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              top: _animation.value,
              left: 60,
              child: Hero(
                tag: widget.planetCardModal.planet,
                child: Image.asset(
                  widget.planetCardModal.planetImage,
                  height: 250,
                  width: 300,
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 100,
                    left: 160,
                    child: Image.asset(
                      widget.planetCardModal.numberImage,
                      width: 150,
                      height: 180,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 36, 30, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: Text(
                            'Explore',
                            style: TextStyle(
                              color: Color(int.parse("0xFF${widget.planetCardModal.color.substring(1)}")),
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: Text(
                            widget.planetCardModal.planet,
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(int.parse("0xFF${widget.planetCardModal.color.substring(1)}")),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(
                          height: 100,
                          width: 280,
                          child: Text(
                            widget.planetCardModal.description,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50, top: 10, right: 200),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).push(createRoute(Detailscreen(index: int.parse(widget.planetCardModal.position)-1)));
                                });
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
