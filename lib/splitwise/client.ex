defmodule Splitwise.Client do
  @moduledoc """
  Defines the `Splitwise.Client` struct, and the HTTP requests functions.
  """

  @base_url "https://www.splitwise.com"

  alias Splitwise.Client.Response

  def get!(url, access_token) do
    result = HTTPoison.get!("#{@base_url}#{url}", ["Authorization": "Bearer #{access_token}"])

    %Response{
      body: decode!(result.body),
      status: result.status_code,
      headers: result.headers
    }
  end

  defp decode!(json) do
    json_lib().decode!(json)
  end

  defp json_lib() do
    Application.get_env(Splitwise.Client, :json_library) || Poison
  end
end
