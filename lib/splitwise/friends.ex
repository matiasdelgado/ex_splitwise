defmodule Splitwise.Friends do
  @moduledoc """
  This module defines the Splitwise.Friends functions
  """

  def list(access_token) do
    Splitwise.Client.get!("/api/v3.0/get_friends", access_token)
  end

  # TODO: "get_friend/" + id
  # def friend_info(id) do
  # end

  # TODO: "create_friend"
  # def create(data) do
  # end

  # TODO
  # def create_friends() do
  # end

  # TODO: "delete_friend/" + id
  # def unfriend(id) do
  # end
end

