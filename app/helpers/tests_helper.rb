# frozen_string_literal: true

module TestsHelper
  def levels
    { 'entry' => (0..1), 'middle' => (2..4), 'advanced' => (5..10) }
  end

  def test_level(level)
    levels.select { |k, v| v.include?(level) }.keys.first
  end
end
