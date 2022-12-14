# frozen_string_literal: true

require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category1 = Category.create(name: 'Category1')
    @category2 = Category.create(name: 'Category2')
  end

  test 'should display category listings' do
    get '/categories'
    assert_select 'a[href=?]', category_path(@category1), text: @category1.name
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end
end
