import 'package:activity_starport/explore/explore_detail.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  final List<Map<String, String>> touristSpots = const [
    {
      "name": "Banaue Rice Terraces",
      "image": "assets/images/banaue.jpg",
      "description":
          "A breathtaking man-made wonder carved into the mountains over 2,000 years ago, these lush green terraces showcase the ingenuity of the Ifugao people."
    },
    {
      "name": "Boracay Island",
      "image": "assets/images/boracay.jpg",
      "description":
          "Famous for its powdery white sand and crystal-clear waters, this tropical paradise offers vibrant nightlife and stunning sunsets."
    },
    {
      "name": "Chocolate Hills",
      "image": "assets/images/chocolate_hills.png",
      "description":
          "A unique geological formation of over 1,200 cone-shaped hills that turn brown in the dry season, resembling giant chocolate mounds."
    },
    {
      "name": "Mayon Volcano",
      "image": "assets/images/mayon.jpg",
      "description":
          "Known for its almost perfect cone shape, this active volcano is both beautiful and dangerous, standing majestically over the province."
    },
    {
      "name": "Puerto Princesa",
      "image": "assets/images/puerto_princesa.jpg",
      "description":
          "Home to the breathtaking Underground River, this nature-rich city boasts limestone karsts, pristine beaches, and vibrant marine life."
    },
    {
      "name": "Siargao Cloud 9",
      "image": "assets/images/siargao.jpg",
      "description":
          "A world-renowned surfing spot with powerful waves and a scenic boardwalk, drawing surfers and beach lovers alike."
    },
    {
      "name": "Taal Volcano (Batangas)",
      "image": "assets/images/taal.jpg",
      "description":
          "Visitors can expect a breathtaking view of the world's smallest active volcano, surrounded by a vast crater lake with shimmering blue waters. The unique landscape, with its island-within-a-lake-within-an-island formation, creates a surreal and picturesque setting."
    },
    {
      "name": "Camiguin Island",
      "image": "assets/images/camiguin.jpeg",
      "description":
          "Known as the 'Island Born of Fire', Camiguin boasts volcanic peaks, lush forests, and pristine white sandbars. Tourists can enjoy panoramic views of Mount Hibok-Hibok, turquoise waters, and the iconic White Island floating just off the coast."
    },
    {
      "name": "Enchanted River (Surigao del Sur)",
      "image": "assets/images/enchantedriver.jpg",
      "description":
          "A mesmerizing deep-blue river hidden within a forest, the Enchanted River is famous for its crystal-clear waters that seem to glow under the sunlight. The surrounding lush greenery and limestone formations add to its mystical and serene beauty."
    },
    {
      "name": "Kawasan Falls (Cebu)",
      "image": "assets/images/kawasan.jpg",
      "description":
          "A multi-tiered waterfall with stunning turquoise waters cascading into natural pools, Kawasan Falls is surrounded by lush tropical forests. The vibrant greenery and the refreshing mist from the falls create a dreamy, tropical paradise."
    },
    {
      "name": "Batanes",
      "image": "assets/images/batanes.jpeg",
      "description":
          "Known for its rolling hills, dramatic cliffs, and vast ocean views, Batanes offers a landscape that feels untouched and surreal. Visitors can marvel at the endless green pastures, rugged coastlines, and traditional stone houses that blend perfectly with the scenery."
    },
    {
      "name": "Hundred Islands (Pangasinan)",
      "image": "assets/images/hundredisland.jpg",
      "description":
          "A collection of 124 small islands scattered across emerald waters, offering scenic views of limestone formations and white sandy beaches. Visitors can expect picturesque landscapes perfect for island hopping, snorkeling, and panoramic photography."
    },
    {
      "name": "Mt. Apo (Davao)",
      "image": "assets/images/mtapo.jpg",
      "description":
          "The Philippines' highest peak offers breathtaking views of mountain ranges, dense forests, and crater lakes. Reaching the summit provides a stunning 360-degree vista, often with a sea of clouds below and golden sunrises above."
    },
    {
      "name": "Siquijor",
      "image": "assets/images/siquijor.jpg",
      "description":
          "Known for its mystical charm, Siquijor features white-sand beaches, hidden waterfalls, and centuries-old balete trees surrounded by natural springs. The island’s coastal views, with crystal-clear waters and vibrant coral reefs, make it a paradise for nature lovers."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: touristSpots.length,
          itemBuilder: (context, index) {
            final spot = touristSpots[index];
            return OpenContainer(
              closedElevation: 5,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              transitionType: ContainerTransitionType.fadeThrough,
              closedBuilder: (context, action) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.asset(
                      spot["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            spot["name"]!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            spot["description"]!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              openBuilder: (context, action) => DetailScreen(spot: spot),
            );
          },
        ),
      ),
    );
  }
}
