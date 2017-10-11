module Surveys
  class Builder

    PAGE_LIMIT = 10

    def basic_details obj, page
      obj.attributes.merge({
        questions: obj.questions,
        responses: response_details(obj, page)
      })
    end


    private


    def response_details obj, page
      collection = []

      obj.responses
        .by_limit(1, PAGE_LIMIT).each do |response|
          collection.push(
            response.attributes.merge({
                response_questions: response.response_questions
              })
          )
      end

      collection
    end

  end
end
