class Admin::Header::ProfileComponent < ApplicationComponent
  def initialize(*args, **kwargs)
    super(*args, **kwargs)
  end

  def before_render
    self.classes = "flex items-center space-x-2 focus:outline-none text-text-secondary"
  end

  def call
    content_tag :div, options do
      content_tag :img, nil, class: "w-10 h-10 rounded-full border-2 border-violet-500", src: "/user.png"
    end
  end
end
