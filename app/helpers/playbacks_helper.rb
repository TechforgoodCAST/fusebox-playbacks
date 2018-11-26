# TODO: test
module PlaybacksHelper
  def confidence_label(value)
    {
      0 => '0 - Not at all confident',
      10 => '10 - Extremely confident'
    }[value] || value
  end

  def comment_done_message(comment)
    comment.done? ? 'marked as done' : 'commented'
  end

  def context(playback)
    period(playback) + tag.br + author(playback)
  end

  def line_through(step)
    step.completed_on? ? 'details line-through' : 'details'
  end

  def notes(str)
    tag.div(raw(str), class: 'center fs14 mb60 notice') if str.present?
  end

  def organisation(playback)
    title(playback) +
    tag.p(playback.project_name, class: 'bold') +
    tag.p(playback.description, class: 'fs14')
  end

  def with_default(str)
    str.blank? ? '-' : str
  end

  def status(insight)
    str = insight.name.titleize
    str << ": #{insight.certainty.titleize}" if insight.certainty.present?
    tag.div(str, class: 'tag mb20 ' + insight.certainty_color)
  end

  private

    def author(playback)
      return tag.span if playback.author_name.blank?

      tag.span('by ') + tag.strong(playback.author_name)
    end

    def period(playback)
      return tag.span if playback.period.blank?

      tag.span('Playback from ') + tag.strong(playback.period)
    end

    def title(playback)
      if playback.logo_url.present?
        tag.img(src: playback.logo_url, width: 270)
      else
        tag.div { tag.h1(playback.organisation_name) }
      end
    end
end
