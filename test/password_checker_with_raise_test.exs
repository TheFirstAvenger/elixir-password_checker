defmodule PasswordCheckerWithRaiseTest do
  use ExUnit.Case

  test "tests" do
    assert PasswordCheckerWithRaise.password_valid!("abc1234") == "abc1234"
    assert_raise RuntimeError, "Password too short", fn -> PasswordCheckerWithRaise.password_valid!("abc123") end
    assert_raise RuntimeError, "Invalid first letter", fn -> PasswordCheckerWithRaise.password_valid!("\x{0000}bc1234") end
  end
end
