class PlaybacksController < ApplicationController
  before_action :authenticate_user!, except: %[show]
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
      @playback = Playback.includes(sections: [insights: [:steps]])
                          .find(params[:id])
    end

    def playback_params
      params.require(:playback).permit(
        :organisation_name, :project_name, :author_name, :period, :logo_url,
        :description, :notes, :source,
        sections_attributes: [
          :id, :confidence, :name, :description, :_destroy,
          insights_attributes: [
            :id, :name, :section_id, :certainty, :description, :successes,
            :improvements, :learnings, :notes, :include_retro, :_destroy,
            steps_attributes: %i[id name due_on _destroy]
          ]
        ]
      )
    end
end
