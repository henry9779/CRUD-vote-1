class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    find_candidate

    if @candidate.save
      redirect_to root_path, notice: '新增候選人成功'
    else
      render :new
    end
  end


  private
  def find_candidate
    @candidate = Candidate.new(params[:id])
  end
end