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
  To pay debt, create a new expense with the value `payment: true`.

  ## Example
      iex> expense = %ExSplitwise.Models.Expense{
        cost: 500,
        currency_code: "UYU",
        group_id: 987675,
        users: [
          %{id: 12345, paid_share: 0, owed_share: 500},
          %{id: 23456, paid_share: 500, owed_share: 0},
        ],
        category_id: 18,
        description: "Sample expense",
        creation_method: "equal",
        payment: false
      }
      iex> ExSplitwise.Expenses.create(expense)
      %ExSplitwise.Client.Response{
        body: %{
          "errors" => %{},
          "expenses" => [
            %{ ... }
          ]
        },
        headers: [
          {"Content-Type", "application/json; charset=utf-8"},
        ],
        status: 200
      }

  ## Example: paying debt
      iex> expense = %ExSplitwise.Models.Expense{
        cost: 100,
        currency_code: "UYU",
        group_id: 987675,
        users: [
          %{id: 12345, paid_share: 100, owed_share: 0},
          %{id: 23456, paid_share: 0, owed_share: 100},
        ],
        category_id: 18,
        description: "Payment",
        payment: true
      }
      iex> ExSplitwise.Expenses.create(expense)
      %ExSplitwise.Client.Response{
        body: %{
          "errors" => %{},
          "expenses" => [
            %{ ... }
          ]
        },
        headers: [
          ...
        ],
        status: 200
      }

  ## Example: error response
      iex> ExSplitwise.Expenses.create(expense)
      %ExSplitwise.Client.Response{
        body: %{
          "errors" => %{
            "base" => ["Splitwise cannot sync this expense. For further help, contact ..."]
          },
          "expenses" => []
        },
        headers: [
          ...
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
      iex> ExSplitwise.Expenses.delete(id)
      %ExSplitwise.Client.Response{
        body: %{"errors" => %{}, "success" => true},
        headers: [
          ...
        ],
        status: 200
      }
  """
  def delete(id) do
    Client.post!("/api/v3.0/delete_expense/#{id}")
  end
end
