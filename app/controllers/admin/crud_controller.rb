class Admin::CrudController < Admin::AdminController
  before_action :set_model
  before_action :set_record, only: %i[ edit update destroy ]

  def index
    @pagy, @records = pagy @model.all
  end

  def new
    @record = @model.new
  end

  def create
    @record = @model.new record_params

    if @record.save
      redirect_to admin_index_path(model: @model)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @record.update record_params
      redirect_to admin_index_path(model: @model_name), notice: "#{@model_name} updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_model
    @model_name = params[:model].classify
    @model = @model_name.constantize
  end

  def set_record
    @record = @model.find_by(params[:id])
  end

  def record_params
    permitted_fields = helpers.editable_fields_with_types(@model).keys.map(&:to_sym)
    params.require(@model_name.underscore.to_sym).permit(permitted_fields)
  end
end
