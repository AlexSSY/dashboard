# frozen_string_literal: true

class UI::TextComponent < ApplicationComponent
  strip_trailing_whitespace

  def initialize(text = nil, *args, dark: true, **kwargs)
    super(*args, **kwargs)
    if dark
      self.classes = "text-violet-950 dark:text-invert"
    else
      self.classes = "text-violet-950"
    end
    @text = text
  end

  attr_reader :text

  def call
    content_tag :span, self.options do
      text || content
    end
  end
end
