# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { username: 'Admin', password: 'foobar' },
  { username: 'jorah_mormont', password: 'friendzone' }
])

categories = Category.create([
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'Data science' }
])

tests = Test.create([
  { title: 'Ruby', level: 1, category_id: categories[0].id },
  { title: 'Python', level: 1, category_id: categories[0].id },
  { title: 'JavaScript', level: 2 },
  { title: 'Machine Learning', level: 3 }
])

questions = Question.create([
  {
    body: 'The difference between using double quotes '\
          'and single quotes to make a string, is',
    test_id: tests[0].id
  },
  {
    body: 'Instance variables in ruby are prefixed by _____ symbol',
    test_id: tests[0].id
  }
])

answers = Answer.create([
  {
    body: 'Single quotes will ignore any variables it finds with #{}, '\
          'while double quotes will replace the variables it finds with #{}',
    correct: true,
    question_id: questions[0].id
  },
  {
    body: 'Double quotes will ignore any variables it finds with #{}, '\
          'while single quotes will replace the variables it finds with #{}',
    question_id: questions[0].id
  },
  {
    body: '@',
    correct: true,
    question_id: questions[1].id
  },
  {
    body: '^',
    question_id: questions[1].id
  },
  {
    body: '$',
    question_id: questions[1].id
  }
])
