defmodule Splitwise.Users do
  @moduledoc """
  This module defines the Splitwise.Users functions
  """

  def current(access_token) do
    Splitwise.Client.get!("/api/v3.0/get_current_user", access_token)
  end

  # TODO: "get_user/" + id
  # def user_info(id) do
  # end

  # TODO: "update_user/" + id
  # def update_user(id, data) do
  # end
end
