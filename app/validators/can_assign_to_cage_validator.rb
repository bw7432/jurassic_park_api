class CanAssignToCageValidator < ActiveModel::Validator
  def validate(record)
    # record.errors.add :base, "This is some custom error message"
    record # => The person instance being validated
    options # => Any non-standard options passed to validates_with
  end
end