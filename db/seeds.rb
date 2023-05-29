# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(name: "Chris", email: "chris@walks.com", password: "password", password_confirmation: "password")

user.questions.create!([
    {
        title: "How do I buy walking shoes?",
        body: "I want to buy some walking shoes. What should I look for?"
    },
    {
        title: "What's a good route to walk?",
        body: "I want to walk 5 miles. What's a good route?"
    },
    {
        title: "I've never walked before!",
        body: "I've never walked before. What should I do?"
    },
    {
        title: "What do I eat on a walk?",
        body: "I want to eat something on my walk. What should I eat?"
    },
    {
        title: "How to prevent soreness?",
        body: "I'm sore after walking. How do I prevent soreness?"
    }
])

Question.all.each do |question|
    question.answers.create!([
        {
            body: "This is a helpful answer.",
            user: user
        },
        {
            body: "This is a neutral answer.",
            user: user
        },
        {
            body: "This is a useless answer.",
            user: user
        }
    ])
end
