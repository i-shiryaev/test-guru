# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { username: 'Admin', password: 'foobar' },
  { username: 'jorah_mormont', password: 'friendzone' }
])

categories = Category.create!([
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'Data science' }
])

tests = Test.create!([
  { title: 'Ruby', level: 1, category: categories[0], author: users[0] },
  { title: 'Python', level: 1, category: categories[0], author: users[0] },
  { title: 'JavaScript', level: 2, category: categories[1], author: users[0] },
  { title: 'Machine Learning', level: 3, category: categories[2], author: users[0] }
])

passed_tests = PassedTest.create!([
    { passed: true, user: users[0], test: tests[0] },
    { passed: true, user: users[0], test: tests[1] },
    { passed: true, user: users[0], test: tests[3] }
])

questions = Question.create!([
  {
    body: 'The difference between using double quotes '\
          'and single quotes to make a string, is',
    test: tests[0]
  },
  {
    body: 'Instance variables in ruby are prefixed by _____ symbol',
    test: tests[0]
  }
])

answers = Answer.create!([
  {
    body: 'Single quotes will ignore any variables it finds with #{}, '\
          'while double quotes will replace the variables it finds with #{}',
    correct: true,
    question: questions[0]
  },
  {
    body: 'Double quotes will ignore any variables it finds with #{}, '\
          'while single quotes will replace the variables it finds with #{}',
    question: questions[0]
  },
  {
    body: '@',
    correct: true,
    question: questions[1]
  },
  {
    body: '^',
    question: questions[1]
  },
  {
    body: '$',
    question: questions[1]
  }
])
