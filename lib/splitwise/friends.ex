defmodule ExSplitwise.Friends do
  @moduledoc """
  This module defines the functions to manage Splitwise friends.
  """

  @doc """
  Get current user's friends.

  ## Example
      iex> ExSplitwise.Friends.all()
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

  @doc """
  Get friend by ID.

  ## Example
      iex> ExSplitwise.Friends.get(1000)
      %ExSplitwise.Client.Response{
        body: %{
          "friend" => %{
            "balance" => [],
            "email" => "beth.bennet@example.com",
            "first_name" => "Elizabeth",
            "groups" => [
              %{"balance" => [], "group_id" => 9000},
              %{"balance" => [], "group_id" => 0}
            ],
            "id" => 1000,
            "last_name" => "Bennet",
            "picture" => %{
              "large" => "...",
              "medium" => "...",
              "small" => "..."
            },
            "registration_status" => "invited",
            "updated_at" => "2019-03-30T01:03:53Z"
          }
        },
        headers: [
          ...
        ],
        status: 200
      }
  """
  def get(id) do
    ExSplitwise.Client.get!("/api/v3.0/get_friend/#{id}")
  end

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

