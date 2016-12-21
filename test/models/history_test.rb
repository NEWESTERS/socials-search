require 'test_helper'

class HistoryTest < ActiveSupport::TestCase
  test 'should not save empty' do
    history = History.new
    assert !history.save
  end
end
