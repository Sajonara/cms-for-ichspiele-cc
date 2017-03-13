require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  
  def setup
    @news = News.new(title: "Test News", content: "Dies ist eine Test-News" )
  end
  
  test "News should be valid" do
    assert @news.valid?
  end
  
end