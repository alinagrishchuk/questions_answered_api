### What

Simple API for creating questions and corresponding answers

### Quick Start

- Make sure you have created `.env` file. The example of it can be found in .env.example. 
- run the following commands 
  - `bin/setup`
  - `rails s`

### How

1. `jsonapi-resources` has been used to simplify and speed up the implementation. 
2. The standard rspec + factorybot were used for testing.
3. The simple `Question has many Answers` approach is used for the first app implementation.
   Later we can add the possibility of adding replies to questions.
4. As an initial simple way to implement the task, we can skip the implementation of the User model and authentication/authorization so that everyone can post questions and answers.
   As a result, anyone can create questions/answers, but no one can modify/delete the content.
