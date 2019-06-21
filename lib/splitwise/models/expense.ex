defmodule ExSplitwise.Models.Expense do
  @moduledoc false

  @enforce_keys [:cost, :users]
  defstruct [
    :cost,
    :currency_code,
    :group_id,
    :users,
    :category_id,
    :description,
    :creation_method
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
        {"cost", 1000},
        {"currency_code", "USD"},
        {"group_id", nil},
        {"category_id", nil},
        {"description", "New expense"},
        {"creation_method", "equal"}
      ]
  """
  def convert(data = %__MODULE__{}) do
    result = [
      { "cost", data.cost },
      { "currency_code", data.currency_code || "USD" },
      { "group_id", data.group_id },
      { "category_id", data.category_id },
      { "description", data.description || "New expense" },
      { "creation_method", data.creation_method || "equal" }
    ]

    # convert all users to plain props
    toList(data.users, result)
  end

  defp toList([], result), do: result
  defp toList([user|users], result) do
    index = length(users)

    toList(users, [
      { "users__#{index}__user_id", user.id },
      { "users__#{index}__paid_share", user.paid_share },
      { "users__#{index}__owed_share", user.owed_share }
    ] ++ result)
  end

  # defp flatten([], result), do: result
  # defp flatten([user|users], result) do
  #   index = length(users)

  #   flatten(users, Map.merge(result, %{
  #     "users__#{index}__user_id" => user.id,
  #     "users__#{index}__paid_share" => user.paid_share,
  #     "users__#{index}__owed_share" => user.owed_share
  #   }))
  # end
end
