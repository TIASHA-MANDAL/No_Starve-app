import 'package:flutter/material.dart';

class newsfeed extends StatefulWidget {
  const newsfeed({super.key});

  @override
  State<newsfeed> createState() => _newsfeedState();
}

class _newsfeedState extends State<newsfeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Latest News",
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Image.asset(
            'assets/images/feed1.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  /*1*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: const Text(
                          'News of the day',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white),
                        ),
                      ),
                      Text(
                        'GLOBAL HUNGER CRISIS IN 2023',
                        style: TextStyle(
                            color: Color.fromARGB(255, 18, 18, 18),
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                /*3*/
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              'The scale of the current global hunger and malnutrition crisis is enormous, '
              'with an expected 345.2 million people projected to be food insecure – more '
              'than double the number in 2020. An expected 345.2 million people projected '
              'to be food insecure in 2023 more than double the number in 2020. This '
              'constitutes a staggering rise of 200 million people compared to pre-COVID-19 '
              'pandemic levels. More than 900,000 people worldwide are fighting to survive '
              'in famine-like conditions. This is ten times more than five years ago, an'
              'alarmingly rapid increase. An immediate response is needed. The global'
              'community must not fail on its promise to end hunger and malnutrition by 2030.',
              softWrap: true,
            ),
          ),
          Column(children: [
            Image.asset(
              'assets/images/feed2.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    /*1*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*2*/
                        Container(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: const Text(
                            'News of the day',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.white),
                          ),
                        ),
                        Text(
                          'THE CAUSES OF HUNGER AND FAMINE',
                          style: TextStyle(
                            color: Color.fromARGB(255, 18, 18, 18),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*3*/
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Conflict is still the biggest driver of hunger, with 70 percent of the world's"
                'hungry people living in areas afflicted by war and violence. Events in Ukraine '
                'are further proof of how conflict feeds hunger – forcing people out of their '
                "homes, wiping out their sources of income and wrecking countries’"
                "economies. The climate crisis is one of the leading causes of the steep rise in"
                "global hunger. Climate shocks destroy lives, crops and livelihoods, and"
                "undermine people’s ability to feed themselves. Hunger will spiral out of control"
                "if the world fails to take immediate climate action. Global fertilizer prices have"
                "climbed even faster than food prices, which remain at a ten-year high"
                "themselves. The effects of the war in Ukraine, including higher natural gas"
                "prices, have further disrupted global fertilizer production and exports.",
                softWrap: true,
              ),
            ),
            Column(children: [
              Image.asset(
                'assets/images/covid.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      /*1*/
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*2*/

                          Text(
                            'PANDEMIC YEAR MARKED BY SPIKE IN WORLD HUNGRY',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    Icon(
                      Icons.star,
                      color: Colors.red[500],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "There was a dramatic worsening of world hunger in 2020, the United Nations"
                  "said today – much of it likely related to the fallout of COVID-19. While the"
                  "pandemic’s impact has yet to be fully mapped, a multi-agency report"
                  "estimates that around a tenth of the global population – up to 811 million"
                  "people – were undernourished last year. The number suggests it will take a"
                  "tremendous effort for the world to honour its pledge to end hunger by 2030."
                  "This year’s edition ofThe State of Food Security and Nutrition in the World is the"
                  "first global assessment of its kind in the pandemic era. The report is jointly"
                  "published by the Food and Agriculture Organization of the United Nations"
                  "(FAO), the International Fund for Agricultural Development (IFAD), the United"
                  "Nations Children’s Fund (UNICEF), the UN World Food Programme (WFP) and"
                  "the World Health Organization (WHO).",
                  softWrap: true,
                ),
              ),
              Column(children: [
                Image.asset(
                  'assets/images/feed3.webp',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/

                            Text(
                              "Hunger Hotspots",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      /*3*/
                      Icon(
                        Icons.star,
                        color: Colors.red[500],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'From the Central American Dry Corridor and Haiti, through the Sahel,'
                    "Central African Republic, South Sudan and then eastwards to the"
                    "Horn of Africa, Syria, Yemen and all the way to Afghanistan,"
                    "conflict and climate shocks are driving millions of people to the "
                    "brink of starvation. Last year, the world rallied extraordinary "
                    "resources a record-breaking US 14 billion dollar for WFP alone to tackle"
                    "the unprecedented global food crisis. In countries like Somalia,"
                    "which has been teetering on the brink of famine, the international"
                    "community came together and managed to pull people back. "
                    "But it is not sufficient to only keep people alive. "
                    "We need to go further, and this can only be achieved by "
                    "addressing the underlying causes of hunger.",
                    softWrap: true,
                  ),
                ),
                Column(children: [
                  Image.asset(
                    'assets/images/nohunger.jpeg',
                    width: 600,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          /*1*/
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /*2*/

                              Text(
                                "Let's stop Hunger Now",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 19, 60, 94),
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        /*3*/
                        Icon(
                          Icons.star,
                          color: Colors.red[500],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'WFP’s changing lives work helps to build human capital,'
                      " support governments in strengthening social protection programmes,"
                      " stabilize communities in particularly precarious places,"
                      "and help them to better survive sudden shocks without losing all their assets."
                      "In just four years of the Sahel Resilience Scale-up, WFP and "
                      "local communities turned 158,000 hectares of barren fields in the Sahel region"
                      " of five African countries into farm and grazing land."
                      " Over 2.5 million people benefited from integrated activities."
                      "Evidence shows that people are better equipped to "
                      "withstand seasonal shocks and have improved access "
                      "to vital natural resources like land they can work.",
                      softWrap: true,
                    ),
                  ),
                  Column(children: [
                    Image.asset(
                      'assets/images/children.jpg',
                      width: 600,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            /*1*/
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*2*/

                                Text(
                                  "Another year of extreme jeopardy "
                                  "for those struggling to feed their families",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 156, 101, 29),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          /*3*/
                          Icon(
                            Icons.star,
                            color: Colors.red[500],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "The scale of the current global hunger and malnutrition crisis is enormous, with an "
                        "expected 345.2 million people projected to be food insecure – more than double the "
                        "number in 2020. An expected 345.2 million people projected to be food insecure in 2023 – "
                        "more than double the number in 2020. This constitutes a staggering rise of 200 million "
                        "people compared to pre-COVID-19 pandemic levels. More than 900,000 people worldwide "
                        "are fighting to survive in famine-like conditions. This is ten times more than five years ago, "
                        "an alarmingly rapid increase. An immediate response is needed. The global community "
                        "must not fail on its promise to end hunger and malnutrition by 2030. WFP is facing "
                        "multiple challenges – the number of acutely hungry people continues to increase at a pace "
                        "that funding is unlikely to match, while the cost of delivering food assistance is at an all-"
                        "time high because food and fuel prices have increased. Unmet needs heighten the risk of "
                        "hunger and malnutrition. Unless the necessary resources are made available.",
                        softWrap: true,
                      ),
                    ),
                    Column(children: [
                      Image.asset(
                        'assets/images/man.jpg',
                        width: 600,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              /*1*/
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*2*/
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: const Text(
                                      'SIERRA LEONE',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          backgroundColor: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    '15.03.2023',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 18, 18, 18),
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*3*/
                            Icon(
                              Icons.star,
                              color: Colors.red[500],
                            ),
                          ],
                        ),
                      ),
                      Column(children: [
                        Image.asset(
                          'assets/images/woman.jpg',
                          width: 600,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                /*1*/
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*2*/
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: const Text(
                                        'LIBERIA',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      '15.03.2023',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 18, 18, 18),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*3*/
                              Icon(
                                Icons.star,
                                color: Colors.red[500],
                              ),
                            ],
                          ),
                        ),
                        Column(children: [
                          Image.asset(
                            'assets/images/people.jpg',
                            width: 600,
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                  /*1*/
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /*2*/
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 2),
                                        child: const Text(
                                          'NIGER',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              backgroundColor: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        '15.03.2023',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 18, 18, 18),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                /*3*/
                                Icon(
                                  Icons.star,
                                  color: Colors.red[500],
                                ),
                              ],
                            ),
                          ),
                          Column(children: [
                            Image.asset(
                              'assets/images/war.png',
                              width: 600,
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Expanded(
                                    /*1*/
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /*2*/
                                        Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 2),
                                          child: const Text(
                                            'War in Ukraine drives Global Food Crisis',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                backgroundColor: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  /*3*/
                                  Icon(
                                    Icons.star,
                                    color: Colors.red[500],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/zero.png',
                                  width: 600,
                                  height: 240,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        /*1*/
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            /*2*/

                                            Text(
                                              "ZERO HUNGER",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 156, 101, 29),
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /*3*/
                                      Icon(
                                        Icons.star,
                                        color: Colors.red[500],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "When you are in no food waste we can directly fight"
                                    "with hunger and your finale aim is zero hunger .By us"
                                    "we are serving 10,000 plates across cities per Day and"
                                    "we hoping to increase your force and awneers for the"
                                    "people to stop food waste As per statistics, major"
                                    "amounts of food is wasted and sent to landfills major"
                                    "waste comes from households and with hotels and"
                                    "offices. Our main motto is to recuse the food waste"
                                    "and stop people sleeping with hunger Be a fighter"
                                    "against the hunger we are looking for active"
                                    "contribution and make more food must go to the"
                                    "hunger people",
                                    softWrap: true,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/wastage.jpeg',
                                      width: 600,
                                      height: 240,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            /*1*/
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                /*2*/

                                                Text(
                                                  "FOOD WASTAGE",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 156, 101, 29),
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                          /*3*/
                                          Icon(
                                            Icons.star,
                                            color: Colors.red[500],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        "As of 2020, 67 Millions of food are wasted in which is"
                                        "valued at 92,000 crores and the food is sent to"
                                        "landfills , we come here to control the waste of food"
                                        "and help the people to fight against hunger. For every"
                                        "marriages and function around 100 plates to 150"
                                        "plates of food are wasted .so In that situation please"
                                        "make a call for us, we will come to your place and"
                                        "check the quality of food and we will pack them into"
                                        "packets transport them through the van to the"
                                        "identified hunger spots and old ages home and"
                                        "people and roads we distribute them with love. We"
                                        "check the quality of food and pack them into packets"
                                        "and within 3 to 4 we will distribute them to the people"
                                        ".we have a kitchen in the Chennai we cook the food"
                                        "and serve the needy Our main motto is to “ feed"
                                        "people Not landfills “ . A major percentage of excess"
                                        "food is going to Trash and landfills, we are trying to"
                                        "stop this situation and control food waste.",
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ])
                      ])
                    ])
                  ])
                ])
              ])
            ])
          ])
        ])));
  }
}
