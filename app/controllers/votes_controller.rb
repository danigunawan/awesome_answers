class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote          = Vote.new(is_up:   params[:vote][:is_up],
                            question: question, #can be refactored
    #vote.user     = current_user
                            user:     current_user)
    if vote.save
      redirect_to question, notice: "Voted!"
    else
      redirect_to question, alert: "Can't vote!"
    end
  end

  def update
    byebug
    if vote.update(is_up: params[:vote][:is_up])
      redirect_to question, notice: "Vote Changed!"
    else
      redirect_to question, alert: "Vote wans't changed"
    end
  end

  def destroy
    vote.destroy
    #redirect_to question_path(question), notice: "Vote Undone!"
    redirect_to question, notice: "Vote Undone!"
  end

  private

  def vote
    @vote ||= current_user.votes.find params[:id]
  end

  def question
    @question ||= Question.find params[:question_id]
  end

end
