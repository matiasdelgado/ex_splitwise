defmodule Splitwise.Notifications do
  @moduledoc """
  """

  def all(access_token) do
    Splitwise.Client.get!( "/api/v3.0/get_notifications", access_token)
  end
end
