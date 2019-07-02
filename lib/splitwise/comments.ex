defmodule ExSplitwise.Comments do
  @moduledoc """
  This module defines the functions to manage Splitwise comments.
  """

  @doc """
  Get expense's comments.

  ## Example
      iex> ExSplitwise.Comments.get(1000)
      %ExSplitwise.Client.Response{
        body: %{
          "comments" => [
            %{
              "comment_type" => "System",
              "content" => "Este pago se ha registrado utilizando la función \"registrar un pago en efectivo\" de Splitwise. No se ha transferido dinero.",
              "created_at" => "2019-01-24T14:35:54Z",
              "deleted_at" => nil,
              "id" => 2000,
              "relation_id" => 3000,
              "relation_type" => "ExpenseComment",
              "user" => %{
                "first_name" => "Splitwise",
                "id" => 0,
                "last_name" => nil,
                "picture" => %{"medium" => nil}
              }
            }
          ]
        },
        headers: [
          ...
        ],
        status: 200
      }
  """
  def get(expense_id) do
    ExSplitwise.Client.get!("/api/v3.0/get_comments?expense_id=#{expense_id}")
  end
end

