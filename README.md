# Talk the Walk

This Ruby on Rails app provides a platform for users to ask and answer community questions about walking and hiking. This was put together as an interview tech task.

## Running the App

To run the app: 
1. clone into the repository
2. From the repository directory, run the following commands:
    ```
    rails db:migrate db:seed    # Runs migrations and seeds the DB with data
    yarn install                # Installs yarn packages, needed for the frontend
    ./bin/dev                   # Starts the server with the bootstrap frontend
    ```
3. In your browser, go to `http://localhost:3000/`. You should see the following homepage:
    ![Homepage](app\assets\images\homepage.png)

## Features

- The App supports user accounts. To try this, either select `Sign Up` from the nav bar, or `Sign In` with `email: chris@walks.com` and `password: password`. 
    - On signing in you'll be taken back to the homepage.
    - On signing up, you'll be taken to your account overview page, which shows your name and email, as well as your asked questions.
- The homepage lists all current questions, which can be clicked through to see answers.
- You can ask a question by clicking the `Ask a Question` button.
- Question pages show the full question, and all given answers, as well as a button to send you to the new answer form. 

## Descoped Featuers
These are features which were planned for this App given the time constraint, but were moved out of scope. 

- Initially, a liking system was planned with the `like.rb` model. 
- Editing and deleting of questions and answers was partially implemented, but the routing wasn't working as intended, so buttons to control this were removed or put behind beta flags. 
- Sorting of questions and answers by either time and like count, was not implemented since likes were not implemented.

## Short Term Features
These are some ideas for features which could have been added next, given more time.

- Pagination of questions.
- Basic searching of questions based on string matching.
- Ensuring consistent design language of forms and presented questions.
- A "top answers" section of a user details page, given a like system.
- An admin user scope to allow moderation of questions and answers.
- Threaded answers, which could allow a questioner to respond to answers.
- Selecting a "correct" answer, as you'd see in Stackoverflow. 

## Performance Considerations
These are some thoughts and considerations about how the App would (or wouldn't) scale in its current form.

- At the moment, there is no pagination implemented on the question list views, or on answers. It wouldn't be long before that would have to be implemented from both a user experience point of view, and a performance point of view. 
- A caching layer could help speed up requests, especially around loading questions and answers which you wouldn't expect to see many upadtes on. Some sort of voting/liking system would help here, since the first page of answers per question would eventually be fairly consistent. 
- There isn't any explicit additional indexing of columns in the DB at this point, so if DB requets became slow, checking to see if adding indexes would speed up requests. 