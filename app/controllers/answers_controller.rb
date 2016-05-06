class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question
  before_action :find_and_authorize_answer, only: :destroy

  #include QuestionsAnswersHelper
  #helper_method :user_like

  def create
    answer_params    = params.require(:answer).permit(:body)
    @answer          = Answer.new answer_params
    @answer.question = @question
    @answer.user     = current_user
    respond_to do |format|
      if @answer.save
        AnswersMailer.notify_question_owner(@answer).deliver_later
        format.html { redirect_to question_path(@question), notice: "Thanks for answering" }
        #format.js { render js: "alert('success');" }
        format.js { render :create_success }
      else
        flash[:alert] = "not saved"
        # this will render the show.html.erb inside views/questions
        #render "/questions/show"
        format.html { render "/questions/show" }
        format.js { render :create_failure}
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_path(@question), notice: "Answer deleted!" }
      format.js { render }
    end
  end

  def edit
    @answer = Answer.find params[:id]
  end

  private

  def find_question
    @question = Question.friendly.find params[:question_id]
  end

  def find_and_authorize_answer
    #head will stop the HTTP request and send
    @answer = @question.answers.find params[:id]
    redirect_to root_path unless can? :destroy, @answer
  end
end
