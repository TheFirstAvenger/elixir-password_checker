defmodule PasswordChecker do

  @spec password_valid?(String.t) :: boolean
  def password_valid?(p) when is_binary(p), do:  p |> password_long_enough |> starts_with_letter |> not_invalid
  
  @spec password_long_enough(:invalid | String.t) :: :invalid | String.t
  defp password_long_enough(:invalid), do: :invalid
  defp password_long_enough(p) when is_binary(p), do: p |> String.length |> password_long_enough(p)

  @spec password_long_enough(integer, String.t) :: integer | String.t
  defp password_long_enough(l, p) when l > 6, do: p
  defp password_long_enough(_l, _p), do: :invalid

  @spec starts_with_letter(:invalid | String.t) :: :invalid | String.t
  defp starts_with_letter(:invalid), do: :invalid
  defp starts_with_letter(p), do: p |> String.first |> String.printable? |> valid_first_letter(p)

  @spec valid_first_letter(boolean, String.t) :: :invalid | String.t
  defp valid_first_letter(true, p), do: p
  defp valid_first_letter(false, _p), do: :invalid

  @spec not_invalid(String.t | :invalid) :: boolean
  defp not_invalid(:invalid), do: false
  defp not_invalid(_), do: true

end
