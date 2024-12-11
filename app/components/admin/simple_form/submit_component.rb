class Admin::SimpleForm::SubmitComponent < ApplicationComponent
  def initialize(f, *args, method: :post, **kwargs)
    super(*args, **kwargs)
    @f = f
    self.classes = "bg-indigo-500 hover:bg-indigo-400 text-violet-50 px-6 py-3 pl-12 cursor-pointer rounded-full"
    @fa_class = method == :post ? "fa-solid fa-plus" : "fa-solid fa-pen"
  end

  attr_reader :f, :fa_class

  def call
    content_tag :div, class: "inline-block relative" do
      concat content_tag(:icon, nil, class: fa_class + " text-violet-50 absolute text-base top-[50%] -translate-y-[50%] left-5")
      concat f.button(:submit, self.options)
    end
  end
end
