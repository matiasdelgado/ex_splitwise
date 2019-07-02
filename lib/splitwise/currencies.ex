defmodule ExSplitwise.Currencies do
  @moduledoc """
  This module defines the functions to manage Splitwise currencies.
  """

  @doc """
  Get all available currencies.

  ## Example
      iex> ExSplitwise.Currencies.all()
      %ExSplitwise.Client.Response{
        body: %{
          "currencies" => [
            %{"currency_code" => "GBP", "unit" => "£"},
            ...
          ]
        },
        headers: [
          ...
        ],
        status: 200
      }
  """
  def all() do
    ExSplitwise.Client.get!("/api/v3.0/get_currencies")
  end
end
