### What

Simple API for creating questions and corresponding answers

Related to https://github.com/alinagrishchuk/questions_answered_frontend

### How

1. `jsonapi-resources` has been used to simplify and speed up the implementation. 
   The main con of the gem is that it is not that obvious which routes are generated. 
   (i.e. it gives nested routing out of the box.)
2. `dotenv-rails` is used to config Postgres database credentials easily.
3. The standard `rspec` + `factorybot` were used for testing.
4. The simple `Question has many Answers` approach is used for the first app implementation.
   Later we can add the possibility of adding replies to answers.
5. The User model and authentication/authorization functionality have not been implemented, thus everyone can post questions and answers.
   As a result, it looked like a better idea to not implement modify/delete the content functionality. So there are no conflicts in users modifying the content of each other.
6. The API allows creating and retrieving records for the `Questions`.
   Similarly, for `Answers`, only the `create` action is required since the answers can be retrieved through the questions.
7. I have not used the namespace for the API endpoint because it caused issues with `self` links generation in `jsonapi-resources` gem.

### Quick Start
- `git clone git@github.com:alinagrishchuk/questions_answered_api.git`
- Make sure you have created `.env` file. An example of it can be found in `.env.example` file.
- `bin/setup`
- `rails s`

Please note that `rbenv-gemset` or a similar tool has not been used.

####  Running Tests
- `rspec`

### Anything else

The solutions consist of simple `Question` has many `Answers` model relationships.
I also added validations to the attributes, but on the API side only.

Test coverage is not ideal:
- on the backend side, not all the generated 'jsonapi-resources' are covered
- on the frontend side, the `acceptance` tests are not implemented at all. Also, not all the functionality is covered.

I decided to use the simplest way possible to implement the Question-answer app in order to meet the development timeline.
But that can be easily improved during the next phase of development.
