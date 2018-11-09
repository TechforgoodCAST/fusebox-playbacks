class PlaybacksController < ApplicationController
  before_action :set_playback, only: %i[show edit update destroy]

  def index
    @playbacks = Playback.all
  end

  def new
    @playback = Playback.new
  end

  def create
    @playback = Playback.new(playback_params)

    if @playback.save
      redirect_to @playback, notice: 'Playback was successfully created.'
    else
      render :new
    end
  end

  def show
    @insights = @playback.insights.joins(:section)
                         .select('insights.*, sections.name AS s_name')
                         .group_by(&:s_name)
  end

  def update
    if @playback.update(playback_params)
      redirect_to @playback, notice: 'Playback was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @playback.destroy
    redirect_to playbacks_url, notice: 'Playback was successfully destroyed.'
  end

  private

    def set_playback
      @playback = Playback.find(params[:id])
    end

    def playback_params
      params.require(:playback).permit(
        :organisation_name, :project_name, :author_name, :period, :logo_url,
        :description, :notes,
        insights_attributes: [
          :id, :name, :section_id, :certainty, :description, :successes,
          :improvements, :learnings, :notes, :_destroy,
          steps_attributes: %i[id name _destroy]
        ]
      )
    end
end
