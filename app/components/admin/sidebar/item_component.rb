class Admin::Sidebar::ItemComponent < ApplicationComponent
  attr_reader :caption, :description, :fa_class, :current_page, :path, :test_sub_path
  delegate :current_page?, to: :helpers

  def initialize(caption, description, path, fa_class, *args, test_sub_path: true, **kwargs)
    super(caption, path, *args, **kwargs)
    @caption = caption
    @description = description
    @fa_class = fa_class
    @test_sub_path = test_sub_path
    @path = path
    self.classes = "rounded-lg py-4 px-6 flex cursor-pointer transition-all ease-in-out hover:shadow-lg hover:bg-violet-50"
  end

  def before_render
    if test_sub_path
      @current_page = request.path.start_with? path
    else
      @current_page = current_page? path
    end

    if current_page
      self.classes += " shadow-lg bg-violet-50"
    end
  end

  def call
    link_to path, self.options do
      concat left
      concat right
    end
  end

  private

  def left
    content_tag :div, class: "flex-0" do
      content_tag :i, nil, class: fa_class + " text-2xl text-text"
    end
  end

  def right
    content_tag :div, class: "flex-1 ml-4 flex flex-col space-y-2" do
      concat render(UI::TextComponent.new caption, class: "mb-2")
      concat render(UI::TextComponent.new description, class: "text-slate-400 text-sm")
    end
  end
end
