defmodule PasswordCheckerWithRaise do
  
  @spec password_valid!(String.t) :: String.t
  def password_valid!(p) when is_binary(p), do:  p |> password_long_enough! |> starts_with_letter!
  
  @spec password_long_enough!(String.t) :: String.t
  defp password_long_enough!(p), do: p |> String.length |> password_long_enough!(p)

  @spec password_long_enough!(integer, String.t) :: integer | String.t
  defp password_long_enough!(l, p) when l > 6, do: p
  defp password_long_enough!(_l, _p), do: raise "Password too short"

  @spec starts_with_letter!(String.t) :: String.t
  defp starts_with_letter!(p), do: p |> String.first |> String.printable? |> valid_first_letter!(p)

  @spec valid_first_letter!(boolean, String.t) :: String.t
  defp valid_first_letter!(true, p), do: p
  defp valid_first_letter!(false, _p), do: raise "Invalid first letter"
end