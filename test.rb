GREEN_COLOR = "\e[32m"
RED_COLOR = "\e[31m"
RESET_COLOR = "\e[0m"

$test_message = ""
$failed = false

def test(message, &block)
  $failed = false
  $test_message = message
  block.call
  unless $failed
    puts "#{GREEN_COLOR}• PASS: #{$test_message}#{RESET_COLOR}"
  end
end

def assert_equal(a, b)
  if a != b
    puts "#{RED_COLOR}• FAIL: #{$test_message}#{RESET_COLOR}" unless $failed
    $failed = true
    puts "#{RED_COLOR}|--> #{a.inspect} is not equal to #{b.inspect}#{RESET_COLOR}"
  end
end

def assert_not_equal(a, b)
  if a == b
    puts "#{RED_COLOR}• FAIL: #{$test_message}#{RESET_COLOR}" unless $failed
    $failed = true
    puts "#{RED_COLOR}|--> #{a.inspect} is equal to #{b.inspect}#{RESET_COLOR}"
  end
end
