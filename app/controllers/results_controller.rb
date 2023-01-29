class ResultsController < ApplicationController
  before_action :fetch_results, only: [:new, :create]

  def new
    @result = Result.new
  end

  def create
    @result = update_result_if_exists(create_params) || Result.create(create_params)

    if @result.errors.any?
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @results.errors, status: :unprocessable_entity }
      end
    else
      render turbo_stream:
               turbo_stream.replace(
                 'results_table',
                 partial: 'results/results_table',
                 locals:  { results: @results }
               )
    end
  end

  private

  def create_params
    params.require(:result).permit(:course_id, :student_id, :grade)
  end

  # Would not implement in controller for future applications
  def update_result_if_exists(params)
    prev_result = Result.find_by(student_id: params[:student_id], course_id: params[:course_id])

    if prev_result.present?
      prev_result.update(params)
      prev_result
    end
  end

  def fetch_results
    @results = Result.all
  end

end