class Contact < ApplicationRecord
  # Validation
  validates :street_address, :city, :postal_code, :b_start, :b_end, :s_time, :e_time, :phone,
            :email, presence: true
  # reference: https://stackoverflow.com/questions/19353135/what-is-good-way-to-validates-canadian-postal-code-in-rails
  validates :postal_code,
            format: { with: /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/ }
  validates :email,
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
end
