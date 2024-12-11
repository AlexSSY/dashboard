# frozen_string_literal: true

class UI::LinkComponent < UI::TextComponent
  def initialize(text = nil, path = nil, *args, dark: true, **kwargs)
    super(text, *args, dark: dark, **kwargs)

    @path = path || ""
  end

  attr_reader :path, :text

  def call
    link_to path, self.options do
      text || content
    end
  end
end
