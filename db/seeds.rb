# frozen_string_literal: true

class DataCreate
  def initialize
    @index = nil
  end

  def create_users
    3.times do
      User.create([name: Faker::Internet.username(specifier: 5..6),
                   e_mail: Faker::Internet.free_email,
                   password: Faker::Internet.password(min_length: 5, max_length: 7)])
    end
  end

  def create_user_tests
    User.all.each do |user|
      2.times { UserTest.create user_id: user.id, test_id: Test.all.sample.id }
    end
  end

  def create_tests_by_user
    User.all.each do |user|
      4.times { Test.find_by(author_id: nil).update(author_id: user.id) }
    end
  end

  def categories_title
    %i[GreekPhilosophers ProgrammingLanguage Literature]
  end

  def create_categories
    categories_title.each do |title|
      @index = categories_title.index(title)
      category = Category.create title: title
      create_tests(category.id)
    end
  end

  def test_title
    [Faker::GreekPhilosophers.name, Faker::ProgrammingLanguage.name, Faker::Book.author][@index]
  end

  def create_tests(id)
    4.times do
      test = Test.create title: test_title, category_id: id, level: rand(0..2)
      create_questions(test.id)
    end
  end

  def create_questions(id)
    3.times do
      question = Question.create body: Faker::Lorem.question, test_id: id
      create_answers(question.id)
    end
  end

  def answer_body
    [Faker::GreekPhilosophers.quote,
     Faker::Quote.famous_last_words,
     Faker::Quotes::Shakespeare.as_you_like_it_quote][@index]
  end

  def create_answers(id)
    answers = []
    4.times do
      answers << Answer.create(question_id: id, body: answer_body)
    end
    answers.sample.update(correct: true)
  end

  def delete_all
    [Answer, Question, UserTest, Test, Category, User].each(&:delete_all)
  end

  def create_all
    delete_all
    %i[create_categories
       create_users
       create_user_tests
       create_tests_by_user].each { |method| send method }
  end
end

DataCreate.new.create_all
