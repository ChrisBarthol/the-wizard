class ChildValidator < ActiveModel::Validator
  def validate(record)
    if record.child['first_name'] == ''
      record.errors.add(:child_first_name, 'must be present')
    end
  end
end
