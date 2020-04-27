module TestsHelper
  TEST_LEVELS = %w[easy elementary advanced hard hero].freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end
end
