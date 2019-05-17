defmodule Splitwise.Expenses do
  alias Splitwise.Client

  def all(access_token) do
    Client.get!("/api/v3.0/get_expenses", access_token)
  end

  def get(access_token, id) do
    Client.get!("/api/v3.0/get_expense/#{id}", access_token)
  end

  def create(access_token, data) do
    # data = [
    #   {"cost", "500" },
    #   {"currency_code", "UYU" },
    #   {"group_id", "12862315" },
    #   {"users__0__user_id", "13219701" },
    #   {"users__0__paid_share", "0" },
    #   {"users__0__owed_share", "500" },
    #   {"users__1__user_id", "20649636" },
    #   {"users__1__paid_share", "500" },
    #   {"users__1__owed_share", "0" },
    #   {"category_id", "18" },
    #   {"description", "Gasto compartido" },
    #   {"creation_method", "equal" }
    # ]
    body = Splitwise.Models.Expense.convert(data)
    Client.post!("/api/v3.0/create_expense", access_token, body)
  end

  def update(access_token, id, data) do
    body = Splitwise.Models.Expense.convert(data)
    Client.post!("/api/v3.0/update_expense/#{id}", access_token, body)
  end

  def delete(access_token, id) do
    Client.post!("/api/v3.0/delete_expense/#{id}", access_token)
  end
end
