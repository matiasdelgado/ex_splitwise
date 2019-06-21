defmodule ExSplitwise.Friends do
  @moduledoc """
  This module defines the functions to manage Splitwise friends.
  """

  @doc """
  Get current user's friends.

  ## Example
      iex> ExSplitwise.Friends.all("token")
      %ExSplitwise.Client.Response{
        body: %{
          "friends" => [
            %{ ... },
            %{ ... }
          ]
        },
        headers: [
          ...
        ],
        status: 200
      }
  """
  def all() do
    ExSplitwise.Client.get!("/api/v3.0/get_friends")
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

