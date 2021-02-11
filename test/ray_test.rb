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
    assert_equal({ content: true, label: "Boolean" }, payload.content)
  end

  def test_ray_settings
    # default settings
    assert_equal(23517, Ray::Ray.port)
    assert_equal('http://localhost', Ray::Ray.host)

    # override defaults
    Ray::Ray.setup do |config|
      config.port = 1234
      config.host = 'http://example.com'
    end

    assert_equal(1234, Ray::Ray.port)
    assert_equal('http://example.com', Ray::Ray.host)
  end
end
