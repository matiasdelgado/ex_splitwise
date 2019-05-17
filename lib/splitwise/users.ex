defmodule Splitwise.Users do
  @moduledoc """
  This module defines the Splitwise.Users functions
  """

  def current(access_token) do
    Splitwise.Client.get!("/api/v3.0/get_current_user", access_token)
  end

  def get(access_token, id) do
    Splitwise.Client.get!("/api/v3.0/get_user/#{id}", access_token)
  end

  def update(access_token, id, data) do
    body = Map.to_list(data)
    Splitwise.Client.post!("/api/v3.0/update_user/#{id}", access_token, body)
  end
end
