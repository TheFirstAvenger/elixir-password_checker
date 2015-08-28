defmodule PasswordCheckerTest do
  use ExUnit.Case

  test "tests" do
    assert PasswordChecker.password_valid?("abc1234")
    refute PasswordChecker.password_valid?("abc123") #too short
    refute PasswordChecker.password_valid?("\x{0000}bc1234") #first char not a letter
  end
end
