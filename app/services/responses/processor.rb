module Responses
  class Processor

    attr_reader :obj, :errors, :opts

    def initialize opts
      @obj = nil
      @errors = []
      @opts = opts
    end


    def process 
      @obj = init_reponse

      # response_to_default_questions
      response_to_questions

      return_errors unless @obj.save

      return true
    end

    def return_errors
      errors << @obj.errors.full_messages

      return false
    end


    private


    # def response_to_default_questions
    #   opts[:default_questions].each do |default_response|
    #     @obj.response_default_questions.build(
    #       default_question_id: default_response[:id],
    #       default_question: default_response[:question],
    #       answer: default_response[:answer],
    #     )
    #   end
    # end

    def response_to_questions
      opts[:questions].each do |response|
        @obj.response_questions.build(
          question_id: response[:id],
          question: response[:question],
          answer: response[:answer],
          default_question: response[:default_question]
        )
      end
    end    

    def init_reponse
      Response.new(
        respondent_name: opts[:respondent_name],
        survey_id: opts[:survey_id],
        name: opts[:name]
      )
    end

  end
end
