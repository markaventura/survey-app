class Api::V1::Admins::QuestionsController < ApiController

  include CommonActions


  private


  def resource_name
    "Question"
  end

  def obj_params
    params.require(:resource).permit(*%i(
      question
      survey_id
    ))
  end
  
end
