# 23andMeep

## About
23 and Meep utilizes the 23andMe API to gather genetic traits, coupled with responses to a user survey, to generate a user's superhero persona. Those that do not have a 23andMe account are able to proceed as guests, and the app uses randomly selected genetic traits to generate the user's superhero profile.

## Planning Process
23 and Meep started with the idea of consuming the 23andMe API to display genetic trait information in a unique and interesting way. Because I'm a big goofball, that eventually translated into a superhero generator app.

I created a wireframe to help plan the path for the user and the structure of the pages:
[23andMeep Wireframe] (https://ciaraforan.mybalsamiq.com/projects/wdifinalproject/prototype/23andMeep?key=72a4de2709cd494820ae81511e27b75e3aed75d4)

In addition, I created an ERD (Entity Relationship Diagram) to ensure I was thinking through the structure of the data in the right way:

![ERD](./images/23andMeep_ERDiagram.png)

I seeded the database with the 4 questions, the options for each question, and the 4 superhero personas. Future enhancements would include a more complex user survey and more superhero personas.


## Technologies Used
This Ruby-based app was built using Sinatra and Active Record, with data persisted in a sqlite3 database. The 23andMe API is accessed using OAuth for authentication. The front-end uses ERB templates, bootstrap, and JavaScript.

## Lessons Learned
I approached this project as another learning experience – opting to focus on areas where I wanted more experience; however, moving forward, I can see the value in weighing the benefits of different technologies and frameworks to determine the best stack. In addition, for my next app, I’d like to incorporate user stores and testing, as I feel it will not only add value to my app, but will also be another valuable learning experience.
