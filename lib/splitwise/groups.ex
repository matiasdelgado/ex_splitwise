defmodule ExSplitwise.Groups do
  @moduledoc """
  This module defines the functions to manage Splitwise groups.
  """

  @doc """
  Get all the groups.

  ## Example
      iex> ExSplitwise.Groups.all("token")
      %ExSplitwise.Client.Response{
        body: %{
          "groups" => [...]
        },
        headers: [
          ...
        ],
        status: 200
      }
  """
  def all(access_token) do
    ExSplitwise.Client.get!("/api/v3.0/get_groups", access_token)
  end

  @doc """
  Get group by id.

  ## Example
      iex> ExSplitwise.Groups.get("token", 1000)
      %ExSplitwise.Client.Response{
        body: %{
          "group" => %{
            "created_at" => "2019-01-24T00:04:22Z",
            "group_type" => "apartment",
            "id" => 2000,
            "invite_link" => "https://www.splitwise.com/join/xxxxxx",
            "members" => [
              %{
                "balance" => [],
                "email" => "guy.montag@example.com",
                "first_name" => "Guy",
                "id" => 1891,
                "last_name" => "Montag",
                "picture" => %{
                  "large" => "...",
                  "medium" => "...",
                  "small" => "..."
                },
                "registration_status" => "confirmed"
              },
            ],
            "name" => "Cavepot ",
            "original_debts" => [
              %{
                "amount" => "80.0",
                "currency_code" => "UYU",
                "from" => 1891,
                "to" => 2019
              },
            ],
            "simplified_debts" => [
              %{
                "amount" => "168.01",
                "currency_code" => "UYU",
                "from" => 1891,
                "to" => 2019
              },
            ],
            "simplify_by_default" => false,
            "updated_at" => "2019-03-30T01:03:53Z",
            "whiteboard" => nil
          }
        },
        headers: [
          ...
        ],
        status: 200
      } 
  """
  def get(access_token, id) do
    ExSplitwise.Client.get!("/api/v3.0/get_group/#{id}", access_token)
  end

  # TODO: "create_group"
  # def create(data) do
  # end

  # TODO: "delete_group/" + id
  # def delete(id) do
  # end

  # TODO: "add_user_to_group"
  # def add_user(data) do
  # end

  # TODO: "remove_user_from_group"
  # def remove_user(data) do
  # end
end
