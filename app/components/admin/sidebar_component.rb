class Admin::SidebarComponent < ApplicationComponent
  def initialize(*args, **kwargs)
    super(*args, **kwargs)
    self.classes = "bg-violet-100 px-5 py-8 flex flex-col space-y-6"
    self.styles = "grid-area: sidebar;"
  end

  def call
    content_tag :div, self.options do
      content
    end
  end
end
