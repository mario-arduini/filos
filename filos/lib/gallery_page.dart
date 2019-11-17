import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CarouselSlider(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 8),
        pauseAutoPlayOnTouch: Duration(seconds: 4),
        viewportFraction: 1.0,
        items: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/644945527909384217/645365435499282473/IMG_20191115_173605.jpg'),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/644945527909384217/645365436543795221/IMG_20191115_101030.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
