class Api::V1::ResponsesController < ApiController

  include CommonActions

  skip_before_action :authenticate_request, only: :create

  def create
    @service = Responses::Processor.new(obj_params)

    if @service.process
      render_service_obj
    else
      fail ServiceError
    end
  end


  private


  def resource_name
    "Survey"
  end

  def obj_params
    params.require(:resource).permit(
      :name,
      :survey_id,
      :respondent_name,
      questions: [
        :id, 
        :question,
        :answer,
        :default_question
      ],
    )
  end
  
end
