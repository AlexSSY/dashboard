class Admin::UI::ButtonComponent < UI::LinkComponent
  def initialize(text, path, fa_class = nil, *args, variant: :info, **kwargs)
    super(text, path, *args, dark: false, **kwargs)
    @fa_class = fa_class
    self.classes = "transition-all ease-in-out text-violet-50 py-3 px-6 rounded-full"
    case variant
    when :info
      self.classes += " bg-indigo-500 hover:bg-indigo-400"
    when :danger
      self.classes += " bg-rose-500 hover:bg-rose-400"
    end
  end

  attr_reader :fa_class

  def call
    link_to path, self.options do
      concat fa_class ? fa_icon : ""
      concat (text || content)
    end
  end

  def fa_icon
    content_tag :icon, nil, class: fa_class + " mr-5"
  end
end
