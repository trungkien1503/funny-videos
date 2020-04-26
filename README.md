# Funny videos

This is a funny videos web app where users can share any youtube videos.
Follow mock design from Remitano

## What I got
- Build a rails application which can work with youtube videos
- View videos as a list
- View videos as grid
- Your videos page
- Integration with devise for users authentication
- Logged in users can share videos
- Visitors can see public pages as movie lists but need to login to share a video or see their videos
- Can register/login user, login user by entering the username and password
- Check the quality of code with rubocop styles and some tools
- Unit tests, integration tests with `rspec`, `capybara`, `database_cleaner` and some gems
- Add simplecov to check coverage of tests
- Pagination with `kaminary`
- Use git often with a clearly git workflow

## Next ideas
- Use https://github.com/schneems/likeable to add like/dislike function
- Use a video player
- Use front-end framework AngularJS or ReactJS
- Improve UI/UX
- Apply CI to check with unit tests and integration tests and auto deploy
- ...

## Setup

- Install ruby 2.5.7
- bundle install
- Change config of database.yml to your local database
- Run `rake db:setup` (`rake db:create` && `rake db:migrate`)
- Change ENV in `application.yml` if you need

## Deployment
- Deployed to heroku: https://remitano-funny-videos.herokuapp.com/
- Note please add your ENV
