class SpouseValidator < ActiveModel::Validator
  def validate(record)
    if record.spouse['first_name'] == ''
      record.errors.add(:spouse_first_name, 'must be present')
    end
  end
end
