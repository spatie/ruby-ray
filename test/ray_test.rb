# frozen_string_literal: true

require "test_helper"

class RayTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ray::VERSION
  end

  def test_bool_payloads_are_custom_type
    payload = Ray::Payloads::BoolPayload.new(true)
    assert_equal "custom", payload.type
  end

  def test_bool_payload_content
    payload = Ray::Payloads::BoolPayload.new(true)
    assert_equal({content: true, label: "Boolean"}, payload.content)
  end
end
