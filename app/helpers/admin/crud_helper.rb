module Admin::CrudHelper
  def editable_fields_with_types(model)
    fields = model.columns_hash.reject { |name, _| %w[id created_at updated_at password_digest].include?(name) }
                             .transform_values(&:type)

    # Add virtual fields for password and password_confirmation if `has_secure_password` is enabled
    if model.column_names.include? "password_digest"
      fields["password"] = :string
      # fields["password_confirmation"] = :string
    end

    fields
  end

  def all_fields_with_types(model)
    model.columns_hash.reject { |name, _| %w[password_digest].include?(name) }
                             .transform_values(&:type)
  end

  def all_fields(model_class)
    model_class
  end

  # form helpers

  def determine_path(record)
    model_name = record.class.name
    record.new_record? ? admin_create_path(model: model_name) : admin_update_path(model: model_name, id: record.id)
  end

  def determine_method(record)
    record.new_record? ? :post : :patch
  end

  def input_type_for(field_type)
    case field_type
    when :string, :text
      :string
    when :integer, :decimal
      :number
    when :boolean
      :boolean
    when :datetime, :date, :time
      :datetime
    else
      :string
    end
  end
end
