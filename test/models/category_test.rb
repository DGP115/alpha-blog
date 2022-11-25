# frozen_string_literal: true

# Test cases for resource "category"

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'category object is valid' do
    @category = Category.new(name: 'category1')
    assert @category.valid?
  end
end
