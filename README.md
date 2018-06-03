# edukasyon_ph

# Edukasyon.ph Full-Stack Developer Interview Project

Use Ruby on Rails to create this application, latest versions preferred but not required
Let’s write an education-related app! As students, when we pick classes, several different
professors teach that class, and we have no idea what that professor will be like. What if
students can rate the professors for each class, so that other students can see the ratings for
each professor before deciding?

# Requirements
As a user, I should be able to navigate to a page that has several classes, like “Math 101”,
“Math 102”, “Biology 110”, “Biology 111”, and so forth. When I click on a class, I should be
directed to a Class page and I should see a list of all the professors that teach that class, and
the average rating for that professor for that class. I can also rate that professor from a scale of
1 to 5 (5 is excellent, 1 is bad).
The review should have a description field, a rating (1 to 5 with 1 being the lowest, and 5 being
the highest), and relationship to a specific class/professor.
Also, have a CRUD backend system (keep this simple, don’t worry about the UI or any extra
functionality) where you can add and manage courses, professors, and add professors to a
class, and classes to a professor. A class can have many professors, and a professor can teach
many classes. (Thus, this would be a many-to-many relationship between classes and
professors, or a “has_and_belongs_to_many” with join table). Don’t worry about user
authentication.

# Bonus Points (none of the below stuff is required to pass the interview, but you can impress us further by doing the below stuff or any other creative things you can think of)

* Students can write a detailed review of the professor, instead of just a rating number
* Make the class/professors system interactive using Ajax or any JS frameworks (examples: the
rating system can be stars instead of numbers)
* A professor page, where I can see the average overall rating of that professor, and then see a
list of classes he/she teaches below with the average rating
* Anything else you want to add to show off your skills, creativity, or to make the project look
and work more exciting

You will have 5 days to work on this project. You can either submit this to us by pushing it to a
Git repository (public) that we can check out and clone, or just compress it into a zip file. Feel
free to add any data migrations or seed data, but this is not necessary. Also include any
instructions to that we may need to setup your application.

Finally, please do not worry if you don’t fully complete this project by the deadline. Just send
to us what you completed, and we’ll still review the code you submitted. There is no one right 
answer to do this project - we are just testing you on what you can complete, how you follow
requirements and directions, and review your coding style, regardless if you have completed it
or not. Of course, feel free to contact us anytime if you have any questions or comments on
this project. Our contact info:

# Rudy Sombillo
rsombillo@edukasyon.ph
0998 849 5254 (text, WhatsApp, Viber all ok)