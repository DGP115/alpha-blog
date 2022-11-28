# frozen_string_literal: true

# Class Category serves as the Rails model for entity "category" in this blog app
# A category is an many-many attribute of an article
#
class Category < ApplicationRecord
  validates :name,  presence: true, uniqueness: true,
                    length: { minimum: 3, maximum: 25 }
end
