module Surveys
  class Processor

    attr_accessor :obj, :errors

    def initialize opts
      @obj = Survey.new(opts)
      @errors = []
    end

    def save_with_default_questions
      build_default_questions

      return_errors unless obj.save

      return true
    end

    def return_errors
      errors << obj.errors.full_messages

      return false
    end


    private


    def build_default_questions
      DefaultQuestion.order('id ASC').each do |default_question|
        obj.questions.build(
            question: default_question.question,
            default_question: true
          )
      end
    end

  end
end
