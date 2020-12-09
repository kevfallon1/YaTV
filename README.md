# YaTV

Installation video: https://youtu.be/UHB_Z0kHEek              
Task/Report demonstration video: https://youtu.be/u9oW3QQCkEI      
Required Installations:
- Python
- Flask
- Flask_Login
- Passlib

To run this web app in a VM, navigate to the YaTV directory, and execute the following commands:
- export FLASK_APP=yatv.py
- flask run

Yet another TV app. Access all your streaming platforms, along with their associated shows and videos in one location

Users in the system have a first and last name, an identifying email address, their password, and their country. Because YaTV.app is really “Yet Another TV app” users are an integral part of the data we collect. Users interact with videos by being able to search and watch them, liking any of the videos they have watched, and can even create a “My List” which is composed of all videos and/or shows they would like to come back to later. We are keeping track of the videos that a user watches via the "Watched" table, and are assuming that a user can only like a video if they have watched it. We do however, keep track of every video that a user likes. Additionally, we can derive every video or show that they've added to their "MyList" via the Videolist and Showlist tables. The YaTV.app does need to be profitable, so we track users’ subscriptions to apps, specifically the expiration and cost of these subscriptions so we can take our cut. 

Each app is uniquely identified by its name, has a description, a customer rating, and its current version. In addition, each app can be available on any number of platforms, including none. We are assuming that an application can exist without an associated platform, as apps can be announced before they are released on any particular platform. For each AppPlatform relation, we keep track of the app's rating and version on that particular platform. On each platform, we maintain if each is available on mobile or not to better understand the customer base.

These apps would be useless if they didn’t provide our users with any content! Each video in our database has a title, a description, release date, a duration, and any number of tags which place it into groups. This works similarly to a hashtag where content that corresponds to a topic is grouped together. Each of these videos has one corresponding app, however, these videos may be either free to any user or blocked to only subscribers.

Lastly, videos are portions of shows if necessary. Shows have unique titles, descriptions, and a sequence of numbered seasons which each contain their own series of videos (the season). We are assuming that a show can exist without any associated seasons, as a show can be in concept before any seasons are released. If a video is a movie, let’s say, the video does not need to be in a show. However, if a video is identified as being in a series it must be part of only one season in one show. 
