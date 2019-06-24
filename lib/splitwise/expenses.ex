defmodule ExSplitwise.Expenses do
  @moduledoc """
  This module defines the functions to manage Splitwise expenses.
  """

  alias ExSplitwise.Client

  @doc """
  Get user's expenses.

  ## Example
      iex> ExSplitwise.Expenses.all()
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
  def all() do
    Client.get!("/api/v3.0/get_expenses")
  end

  @doc """
  Get expense by id.

  ## Example
      iex> ExSplitwise.Expenses.get(28091891)
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
  def get(id) do
    Client.get!("/api/v3.0/get_expense/#{id}")
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
      iex> %{body: expenses} = Splitwise.Expenses.create(expense)
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
  def create(data) do
    body = ExSplitwise.Models.Expense.convert(data)
    Client.post!("/api/v3.0/create_expense", body)
  end

  @doc """
  Update expense by id.
  """
  def update(id, data) do
    body = ExSplitwise.Models.Expense.convert(data)
    Client.post!("/api/v3.0/update_expense/#{id}", body)
  end

  @doc """
  Delete expense by id.

  ## Example
      iex> Splitwise.Expenses.delete(id)
  """
  def delete(id) do
    Client.post!("/api/v3.0/delete_expense/#{id}")
  end
end
