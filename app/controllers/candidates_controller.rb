class CandidatesController < ApplicationController
  def index
  end

  def new
    @candidate = Candidate.new
  end
end