
class Admin::Header::SearchComponent < ApplicationComponent
  def initialize(*args, **kwargs)
    super(*args, **kwargs)
    self.classes = "relative w-full text-violet-950 dark:text-violet-50"
  end

  def call
    content_tag :div, options do
      concat search_icon
      concat input
    end
  end

  private

  def input
    content_tag :input, nil, placeholder: "Search...", type: :text, class: "pl-14 rounded-full w-full border-violet-200 focus:ring-violet-300 focus:border-violet-300"
  end

  def search_icon
    content_tag :icon, nil, class: "fa-solid fa-magnifying-glass text-violet-400 absolute top-[50%] -translate-y-[50%] left-6"
  end
end
