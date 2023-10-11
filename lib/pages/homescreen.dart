import 'package:flutter/material.dart';
import 'package:brainiac/pages/components/linechart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

//Class Reply
class Reply {
  final String author;
  final String content;

  Reply(this.author, this.content);
}

///Forum Suggestion Class
class ForumSuggestion {
  final String title;
  final String author;
  final String profileImage;
  final int likes;
  final int shares;
  List<Reply> replies;

  ForumSuggestion(this.title, this.author, this.profileImage, this.likes,
      this.shares, this.replies);
}

/// Home screen.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  //List to hold forum suggestions
  List<ForumSuggestion> _forumSuggestions = [
    ForumSuggestion(
      "Can anybody suggest me backend resources here?",
      "Riya",
      "assets/images/memoji2.png",
      15,
      5,
      [
        Reply("Niranjan",
            "Check out IBM Back-End Development Course! It's worth it."),
        Reply("Adi",
            "I need suggestions for DevOps 👻")
      ],
    ),
    ForumSuggestion( "I'm in first year of CSE so which programming language is preferrable to learn first!!!!", "Chitrang", "assets/images/memoji3.png", 25, 10, [
      Reply("Manoj", "Python is a great choice for beginners 🥰"),
      Reply("Piyush",
          "Java is also widely used and has good learning resources and you can check courses on here eLearnify! Cheers 🥂"),
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/memoji1.png", width: 38.0),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pratik Bhavarthe",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.deepOrange)),
                            Text("Developer",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.0,
                                    color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.notifications_active_outlined),
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your Enrollments",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text("See all",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent)),
                  ],
                ),
                const SizedBox(height: 20.0),
                _makeYourCourses(size.width - 40.0),
                const SizedBox(height: 30.0),
                Text("Statistics",
                    style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 20.0),
                LineChartSample(),
                const SizedBox(height: 30.0),
                Text("For You", style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 20.0),
                _makeForYouCard("Data Engineering", "ibm.png", size.width),
                const SizedBox(height: 10.0),
                _makeForYouCard("Cyber Security", "google.png", size.width),
                const SizedBox(height: 10.0),
                _makeForYouCard("Cloud Computing", "microsoft.png", size.width),
                const SizedBox(height: 10.0),
                _makeForYouCard(
                    "Machine Learning", "GeeksforGeeks.png", size.width),
                const SizedBox(height: 10.0),
                _makeForYouCard(
                    "Full Stack Web Development", "uniofmichigan.png", size.width),
                const SizedBox(height: 10.0),
                //Forum Section
                const SizedBox(
                  height: 30.0,
                ),
                Text("Community Discussions",
                    style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 20.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _forumSuggestions.length,
                  itemBuilder: (context, index) {
                    return _buildForumSuggestionCard(_forumSuggestions[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        margin: EdgeInsets.all(20.0),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.design_services),
            title: Text("Courses"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.book), 
            title: Text("Problems"),
            selectedColor: Colors.amber,
            ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

/// Make your courses widget.
Widget _makeYourCourses(double width) {
  double cardWidth = (width - 10.0) / 2;
  return Column(
    children: [
      Row(
        children: [
          _makeCourseCard("Machine Learning with Python Fundamentals",
              Colors.orangeAccent.withOpacity(0.5), cardWidth, 0.7),
          const SizedBox(width: 10.0),
          _makeCourseCard("Backend Development", Colors.pink.withOpacity(0.5),
              cardWidth, 0.4),
        ],
      ),
      const SizedBox(height: 10.0), // Spacing between rows
      Row(
        children: [
          _makeCourseCard(
              "SQL Fundamentals", Colors.blue.withOpacity(0.5), cardWidth, 0.6),
          const SizedBox(width: 10.0),
          _makeCourseCard("Data Structures & Algorithms",
              Colors.green.withOpacity(0.5), cardWidth, 0.8),
        ],
      )
    ],
  );
}

/// Make course card widget.
Widget _makeCourseCard(
    String title, Color color, double width, double progress) {
  return Container(
    width: width,
    height: 170.0,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17.0)),
                  const SizedBox(height: 5.0),
                  Text("8 hours progress",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.0)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 8.0,
                    animation: true,
                    percent: progress,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.white,
                    backgroundColor: Colors.black45,
                  ),
                  const SizedBox(width: 5.0),
                  Text((progress * 100).toString() + "%",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white))
                ],
              ),
            ),
          ],
        )),
  );
}

/// Make for you card widget.
Widget _makeForYouCard(String title, String image, double width) {
  return Container(
    height: 75.0,
    width: width,
    decoration: BoxDecoration(
      color: Colors.greenAccent[100],
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800])),
              const SizedBox(height: 5.0),
              Text("35k+ subscribers.",
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600])),
            ],
          ),
          Image.asset("assets/images/" + image, width: 30.0),
        ],
      ),
    ),
  );
}

/// Build forum suggestion card
Widget _buildForumSuggestionCard(ForumSuggestion suggestion) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.0),
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    decoration: BoxDecoration(
      color: Colors.pink[50],
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          suggestion.title,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15.0, color: Colors.black),
        ),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                
                //Profile Image
                CircleAvatar(
                    radius: 18.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(suggestion.profileImage)),
                SizedBox(width: 5.0),
                Text(suggestion.author, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.thumb_up_alt_outlined,
                    size: 18.0, color: Colors.grey),
                SizedBox(width: 5.0),
                Text('${suggestion.likes} Likes',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                SizedBox(width: 10.0),
                Icon(Icons.share, size: 18.0, color: Colors.grey),
                SizedBox(width: 5.0),
                Text('${suggestion.shares} Shares',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        // Display Replies
        for (var reply in suggestion.replies)
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.lime[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reply.author,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(reply.content, style: TextStyle(color: Colors.black87),),
              ],
            ),
          ),
      ],
    ),
  );
}

