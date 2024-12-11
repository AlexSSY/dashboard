class ApplicationComponent < ViewComponent::Base
  attr_accessor :classes
  attr_accessor :styles

  delegate :component, to: :helpers

  def initialize(*args, **kwargs)
    @extra_classes = extract_classes! kwargs
    @extra_styles = extract_styles! kwargs
    @options = kwargs
  end

  protected

  def options
    { class: class_with_extra(@classes), style: style_with_extra(@styles) }.merge(@options)
  end

  def class_with_extra(cls)
    ((cls || "") + " " + @extra_classes).strip
  end

  def style_with_extra(style)
    ((style || "") + " " + @extra_styles).strip
  end

  def extract_classes!(kwargs)
    kwargs.delete(:class)&.strip || ""
  end

  def extract_styles!(kwargs)
    kwargs.delete(:style)&.strip || ""
  end
end
