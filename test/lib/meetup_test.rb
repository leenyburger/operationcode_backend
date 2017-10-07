require 'test_helper'
require_relative '../support/meetups/sample_api_responses'

class MeetupTest < ActiveSupport::TestCase
  test "some test" do
    Meetup.stubs(:get).with("/pro/operationcode/groups", options).returns(group_endpoint_response)

    parsed_response = Meetup.new.operationcode_data

    assert_equal 2, parsed_response.size
    assert_equal 26005124, parsed_response.first['id']
    assert_equal 26005046, parsed_response.last['id']
  end

  def options
    Meetup.new.options
  end
end
