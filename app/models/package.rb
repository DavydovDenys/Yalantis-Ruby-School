# frozen_string_literal: true

class Package < ApplicationRecord
  belongs_to :courier

  validates :tracking_number, presence: true, uniqueness: true
end
