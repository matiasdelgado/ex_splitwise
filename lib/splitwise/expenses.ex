defmodule Splitwise.Expenses do
  def list(access_token) do
    Splitwise.Client.get!("/api/v3.0/get_expenses", access_token)
  end

  def get(access_token, id) do
    Splitwise.Client.get!("/api/v3.0/get_expense/#{id}", access_token)
  end

  # TODO:  "create_expense"
  # def create(data) do
  # end

  # TODO: "update_expense/" + id
  # def update(id, data) do
  # end

  # TODO: "delete_expense/" + id
  # def delete(id) do
  # end
end
