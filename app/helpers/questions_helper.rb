module QuestionsHelper
  ACTIONS = {
    create: 'Create New',
    edit: 'Edit'
  }.freeze

  def question_header(test, type)
    "#{ACTIONS[type]} #{test.title} Question"
  end
end
