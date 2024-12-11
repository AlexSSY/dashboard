class Admin::ScreenComponent < ApplicationComponent
  renders_many :sidebar_items, Admin::Sidebar::ItemComponent
  renders_one :header_content

  def initialize(*args, **kwargs)
    self.classes = "bg-violet-50 min-h-screen"
    self.styles = "display:grid;grid-template-columns:320px 48px 1fr 48px;grid-template-rows:6rem 1fr;grid-template-areas:'sidebar left header right' 'sidebar left body right'"
    super(*args, **kwargs)
  end

  def call
    content_tag :div, self.options do
      concat sidebar
      concat header
      concat content
    end
  end

  protected

  def header
    render Admin::HeaderComponent.new do
      header_content
    end
  end

  def sidebar
    render Admin::SidebarComponent.new do
      sidebar_items.each do |sidebar_item|
        concat sidebar_item
      end
    end
  end
end
