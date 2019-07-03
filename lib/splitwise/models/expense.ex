defmodule ExSplitwise.Models.Expense do
  @moduledoc false

  @enforce_keys [:cost, :users]
  defstruct [
    :cost,
    :group_id,
    :users,
    :category_id,
    currency_code: "USD",
    description: "New expense",
    creation_method: "equal",
    payment: false
  ]

  @doc """
  Converts a Splitwise.Models.Expense to the format expected by Splitwise.
  Particularly, converts the expense's users to a flat list.

  ## Example
      iex> alias ExSplitwise.Models.{Expense, Expense.User}
      iex> users = [%User{ id: 1, paid_share: 500, owed_share: 0 }, %User{ id: 2, paid_share: 0, owed_share: 500 }]
      iex> Expense.convert(%Expense{ cost: 1_000, users: users })
      [
        {"users__0__user_id", 2},
        {"users__0__paid_share", 0},
        {"users__0__owed_share", 500},
        {"users__1__user_id", 1},
        {"users__1__paid_share", 500},
        {"users__1__owed_share", 0},
        {:__struct__, ExSplitwise.Models.Expense},
        {:category_id, nil},
        {:cost, 1000},
        {:creation_method, "equal"},
        {:currency_code, "USD"},
        {:description, "New expense"},
        {:group_id, nil},
        {:payment, false},
      ]
  """
  def convert(data = %__MODULE__{}) do
    {users, data} = Map.pop(data, :users)
    result = Map.to_list(data)

    if users do
      # convert all users to plain props
      toList(users, result)
    else
      result
    end
  end

  defp toList([], result), do: result

  defp toList([user | users], result) do
    index = length(users)

    toList(
      users,
      [
        {"users__#{index}__user_id", user.id},
        {"users__#{index}__paid_share", user.paid_share},
        {"users__#{index}__owed_share", user.owed_share}
      ] ++ result
    )
  end
end
