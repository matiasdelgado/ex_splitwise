defmodule ExSplitwise.Users do
  @moduledoc """
  This module defines the functions to manage Splitwise users.
  """

  @doc """
  Get current logged in user.

  ## Example
      iex> Splitwise.Users.current()
      %Splitwise.Client.Response{
        body: %{
          "user" => %{
            "country_code" => "UY",
            "date_format" => "MM/DD/YYYY",
            "default_currency" => "UYU",
            "default_group_id" => -1,
            "email" => "johndoe@example.com",
            "first_name" => "Winston",
            "force_refresh_at" => nil,
            "id" => 12345,
            "last_name" => "Smith",
            "locale" => "es",
            "notifications" => %{
              "added_as_friend" => true,
              "added_to_group" => true,
              "announcements" => true,
              "bills" => true,
              "expense_added" => false,
              "expense_updated" => false,
              "monthly_summary" => true,
              "payments" => true
            },
            "notifications_count" => 0,
            "notifications_read" => "2019-05-14T00:40:22Z",
            "picture" => %{
              "large" => "...",
              "medium" => "...",
              "small" => "..."
            },
            "registration_status" => "confirmed"
          }
        },
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
        ],
        status: 200
      }
  """
  def current() do
    ExSplitwise.Client.get!("/api/v3.0/get_current_user")
  end

  @doc """
  Get user by id

  ## Example
      iex> Splitwise.Users.get(12345)
      %Splitwise.Client.Response{
        body: %{
          "user" => %{
            "email" => "winston.smith@example.com",
            "first_name" => "Winston",
            "id" => 12345,
            "last_name" => "Smith",
            "picture" => %{
              "large" => "...",
              "medium" => "...",
              "small" => "..."
            },
            "registration_status" => "confirmed"
          }
        },
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
        ],
        status: 200
      }
  """
  def get(id) do
    ExSplitwise.Client.get!("/api/v3.0/get_user/#{id}")
  end

  @doc """
  Update user by id.
  A user can edit anything about their own account, and may edit the first_name, last_name,
  and email for any acquaintances who have not logged in yet.
  ## Example
      iex> ExSplitwise.Users.update(12345, %{ "first_name" => "Atticus", "last_name" => "Finch" })
      %ExSplitwise.Client.Response{
        body: %{
          "user" => %{
            ...
          }
        },
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
        ],
        status: 200
      }
  """
  def update(id, data) do
    body = Map.to_list(data)
    ExSplitwise.Client.post!("/api/v3.0/update_user/#{id}", body)
  end
end
