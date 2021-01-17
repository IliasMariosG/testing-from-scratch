require './test'
require './secret_diary'

# This is a fake class. We've set it up to have the method `SecretDiary` calls,
# return a fake result, and allow our tests to inspect what it was called with.
class FakeDiary
  def read(page)
    @called_with = page
    "Fake secret message"
  end

  def what_was_read_called_with
    @called_with
  end
end

test "that it starts off locked" do
  # Arrange - set up the situation to test within
  fake_diary = FakeDiary.new
  secret_diary = SecretDiary.new(fake_diary)

  # Act - call the behaviour we want to test
  result = secret_diary.locked?

  # Assert - check the result is what we expect
  assert_equal(result, true)
end

test "that it locks" do
  # Arrange
  fake_diary = FakeDiary.new
  secret_diary = SecretDiary.new(fake_diary)
  secret_diary.unlock

  # Act
  result = secret_diary.locked?

  # Assert
  assert_equal(result, false)
end

test "that it does not read the diary when locked" do
  # Arrange
  fake_diary = FakeDiary.new
  secret_diary = SecretDiary.new(fake_diary)

  # Act
  result = secret_diary.read(5)

  # Assert
  assert_equal(result, :forbidden)
  assert_equal(fake_diary.what_was_read_called_with, nil)
end

test "that it reads diary when unlocked" do
  # Arrange
  fake_diary = FakeDiary.new
  secret_diary = SecretDiary.new(fake_diary)
  secret_diary.unlock

  # Act
  result = secret_diary.read(5)

  # Assert
  assert_equal(result, "Fake secret message")
  assert_equal(fake_diary.what_was_read_called_with, 5)
end
