class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
    find_candidate
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to root_path, notice: '新增候選人成功'
    else
      render :new
    end
  end

  def edit
    find_candidate
  end

  def update
    find_candidate

    if @candidate.update
      redirect_to root_path, notice: '資料更新成功'
    else
      render :edit
    end
  end

  def destory
    find_candidate

    @candidate.destory if @candidate
      redirect_to root_path, notice: '刪除成功'
    end
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end