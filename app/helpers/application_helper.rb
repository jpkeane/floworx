# Application-wide Helper
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'REPL Floworx'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def suitability(score)
    if score == 1
      badge = 'badge badge-info'
      text = 'Fair'
    elsif score == 2
      badge = 'badge badge-primary'
      text = 'Good'
    elsif score == 3
      badge = 'badge badge-success'
      text = 'Excellent'
    end

    content_tag(:span, class: badge) do
      text
    end
  end
end
