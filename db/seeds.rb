City.create([ {name: "Cardiff", description: "The annual Cardiff Dog Days of Summer, located in beautiful Cardiff-by-the-Sea, draws 10,000 people from all over San Diego County, with over 200 vendors, tasty food, a blessing of the dogs, dog contest, agility course, kids’ zone, large silent auction, and more. One of the most popular events in north San Diego County."},
              {name: "Carlsbad", description: "Beautiful and balmy days in the coastal city of Carlsbad beckon you to the largest one day street faire anywhere!

The Village Faire features over 850 unique vendors with a little of everything: arts & crafts, antiques, unique clothing, items from around the world, and more. Children’s rides, an international food center, and an old-fashioned pancake breakfast guarantee that you’ll find fun for the whole family!

Parking for this very popular event is limited, so visitors are encouraged to use the complimentary shuttles that run to and from the faire every 15 minutes. The shuttle pick-up locations are at the northwest corner of Sears at Westfield Shoppingtown Plaza Camino Real (Highway 78 and Jefferson) as well as at the Poinsettia Coaster Station (Poinsettia exit off of I-5).


Come browse many of the finest arts and crafts vendors in the most beautiful of settings in the Village of Carlsbad, just two blocks from the beach.

Art in the Village features over 150 local and regional fine artists in mediums such as oil painting, watercolors, photography, mixed media, new media, classical and contemporary sculpture, as well as artisans who work in the mediums of jewelry making, woodworking, furniture, pottery, hand-painted clothing and accessories. Enjoy  live acoustic music, Artist demos and instruction throughout the day."},
              {name: "Encinitas", description: "The Encinitas Street Faire and Fall Festival are located down the center of six blocks of scenic South Coast Highway 101, two blocks from the Pacific Ocean.  This two-day faire in the Spring and one day in the fall draw crowds exceeding 100,000 and feature a booth arrangement that provides half of the vendors with two adjoining sides open to traffic, if they choose.

In the spring street faire, ongoing since 1983, international food, children’s rides, four live stages, and the craft brewery beer garden guarantee that there will be fun for the whole family. In the fall Festival, continuous since 1989, children’s rides, two stages of live entertainment and food and drink refreshments provide an attractive setting for the public and a great boon to our vendors.

The emphasis of both the Encinitas Street Faire and the Fall Festival is on arts, handmade crafts, antiques, and ethnic imports. However, commercial vendors will be accepted and admitted upon consideration of merchandise and display appearance.


The annual Encinitas Oktoberfest community event emphasizes arts & crafts, authentic refreshments, authentic German beer garden and entertainment, exhibits and Chamber of Commerce businesses. Located on El Camino Real and Mountain Vista Drive, this free festival spans 6 blocks, includes over 200 vendors and attracts over 25,000 in attendance. This is a premier Oktoberfest in north San Diego County."},
              {name: "Escondido", description: "The Escondido Grand Avenue Festival, held the 3rd Sunday of May and October, is the second largest single-day festival in California.

Five hundred unique vendor booths line seven blocks of beautiful downtown Escondido along Grand Avenue.

With crowds exceeding 60,000 and a wide variety of food and family entertainment, the festival is expected to provide all our vendors with a successful and enjoyable day, as it has since 1988."},
              {name: "Fallbrook", description: "Fallbrook’s Annual Avocado Festival provides an opportunity for entertainment and camaraderie bringing large numbers of visitors. The central role that the avocado plays in our lives is evident in the Festival’s Farmers Market, Agricultural Area, Avocado Culinary Demonstrations, Guacamole Contest, Avocado Ice Cream, Holy Guaca-Moly, the Art of the Avocado Contest, the Avo 500 Children’s Car Race, and the Best Decorated Avocado Contest.  A wide variety of agricultural displays are also found all along the Festival streets. What a fun-filled way to celebrate our heritage and be entertained at the same time!"},
              {name: "Oceanside", description: "Two event-filled days of sun, sand and surf provide an outstanding opportunity for our vendors to enjoy the thousands of residents and neighbors who come out to experience the many fun activities, including first-rate arts & crafts, great food, sand castle competition, children’s area, Nail “n” Sail competition, military, police and fire displays, and much, much more.

Harbor Days is free to the public. Shuttle buses run all day from various parking locations and to the different venues. Overnight security is provided for vendor peace of mind."},
              {name: "San Marcos", description: "The San Marcos Chamber’s Grand Spring and Grand Harvest Festivals play host to up to 20,000 guests. Artisans and crafters along with local community businesses fill 250 vendor booths along with children’s attractions/carnival rides; a showcase of local talent on the San Marcos Community Stage; varied and delicious food options to choose from; and a stage with live music, all along Via Vera Cruz in San Marcos.

Vendors, reserve your booth space now by clicking the link below to apply. A completed application must be submitted, along with a valid form of payment, to be accepted into the event."},
              {name: "Vista", description: "The Vista Strawberry Festival is the only festival in San Diego County that celebrates all the joys and pleasures of the Strawberry. Vista was once the “Strawberry Capital of the World” and still boasts many strawberry fields. Come enjoy our celebration of the “berry” as we bring over 375 vendors, 10K and 5K certified runs, 1 mile and quarter mile kid’s runs, unique strawberry dessert creations, pie eating competition, costumes and contests, carnival rides, music on 5 stages, international selection of foods, beer garden, and much more together in the beautifully renovated and historic downtown Vista! The Strawberry Festival is by far the largest community event of the year for Vista with an estimated 90,000 in attendance – join us!"}
              ])

Event.create([{date: "August 13, 2016", days: 1, season: "Summer", title: "Dog Days of Summer", city_id: 1},
              {date: "November 6, 2016", days: 1, season: "Fall", title: "Village Faire", city_id: 2},
              {date: "August 14, 2016", days: 1, season: "Summer", title: "Art in the Village", city_id: 2},
              {date: "November 20, 2016", days: 1, season: "Fall", title: "Fall Festival", city_id: 3},
              {date: "October 2, 2016", days: 1, season: "Fall", title: "Oktoberfest", city_id: 3},
              {date: "October 16, 2016", days: 1, season: "Fall", title: "Grand Avenue Festival", city_id: 4},
              {date: "September 24, 2016", days: 2, season: "Fall", title: "Harbor Days", city_id: 6},
              {date: "October 9, 2016", days: 1, season: "Fall", title: "Grand Harvest Festival", city_id: 7},
              {date: "April 9, 2017", days: 1, season: "Spring", title: "Spring Festival", city_id: 7},
              {date: "April 23, 2017", days: 1, season: "Spring", title: "Avocado Festival", city_id: 5},
              {date: "April 29, 2017", days: 2, season: "Spring", title: "Street Faire", city_id: 3},
              {date: "May 7, 2017", days: 1, season: "Spring", title: "Street Faire", city_id: 2}
  ])
