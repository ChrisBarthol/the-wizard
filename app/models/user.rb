class User < ActiveRecord::Base
  validates :last_name, presence: true, if: :step1?
  validates_with SpouseValidator, if: :step2?
  validates_with ChildValidator, if: :step3?

  include MultiStepModel

  def self.total_steps
    3
  end

end
