defmodule ExSplitwise.Expenses do
  @moduledoc """
  This module defines the functions to manage Splitwise expenses.
  """

  alias ExSplitwise.Client

  @doc """
  Get user's expenses.

  ## Example
      iex> ExSplitwise.Expenses.get("token", 28091891)
      %ExSplitwise.Client.Response{
        body: %{
          "expenses" => [
            %{ ...  },
            %{ ...  }
          ]
        },
        headers: [
          ...
        ],
        status: 200
      }
  """
  def all(access_token) do
    Client.get!("/api/v3.0/get_expenses", access_token)
  end

  @doc """
  Get expense by id.

  ## Example
      iex> ExSplitwise.Expenses.get("token", 28091891)
      %ExSplitwise.Client.Response{
        body: %{
          "expense" => %{
            ...
          }
        },
        headers: [
          ...
        ],
        status: 200
      }
  """
  def get(access_token, id) do
    Client.get!("/api/v3.0/get_expense/#{id}", access_token)
  end

  @doc """
  Create new expense.
  In the response body will include a map with the errors, or a list with the created expense.

  ## Example
      iex> expense = %{
        cost: 500,
        currency_code: "UYU",
        group_id: "987675",
        users: [
          %{id: "12345", paid_share: 0, owed_share: 500},
          %{id: "23456", paid_share: 500, owed_share: 0},
        ],
        category_id: 18,
        description: "Sample expense",
        creation_method: "equal"
      }
      iex> %{body: expenses} = Splitwise.Expenses.create("token", expense)
      %Splitwise.Client.Response{
        body: %{
          "errors" => %{},
          "expenses" => [
            %{
              "category" => %{"id" => 18, "name" => "General"},
              ...
            }
          ]
        },
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
        ],
        status: 200
      }
  """
  def create(access_token, data) do
    body = ExSplitwise.Models.Expense.convert(data)
    Client.post!("/api/v3.0/create_expense", access_token, body)
  end

  @doc """
  Update expense by id.
  """
  def update(access_token, id, data) do
    body = ExSplitwise.Models.Expense.convert(data)
    Client.post!("/api/v3.0/update_expense/#{id}", access_token, body)
  end

  @doc """
  Delete expense by id.

  ## Example
      iex> Splitwise.Expenses.delete(id)
  """
  def delete(access_token, id) do
    Client.post!("/api/v3.0/delete_expense/#{id}", access_token)
  end
end
