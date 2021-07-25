module Confirmable
  extend ActiveSupport::Concern

  included do
    validates :submitted, acceptance: true
    validates :confirmed, acceptance: true

    after_validation :confirming

    private

    def confirming
      self.submitted = "1" if submitted == "" && errors.keys == [:submitted]
      self.submitted = "" if confirmed == ""

      errors.delete :submitted
      errors.delete :confirmed
    end
  end
end
