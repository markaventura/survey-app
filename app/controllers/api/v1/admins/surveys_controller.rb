class Api::V1::Admins::SurveysController < ApiController

  include CommonActions

  def create
    @service = Surveys::Processor.new(obj_params)

    if @service.save_with_default_questions
      render_service_obj
    else
      fail ServiceError
    end
  end

  def show
    render json: Surveys::Builder.new.basic_details(@obj, params[:page])
  end


  private


  def resource_name
    "Survey"
  end

  def obj_params
    params.require(:resource).permit(*%i(
      name
    ))
  end
  
end
