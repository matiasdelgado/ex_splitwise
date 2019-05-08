defmodule Splitwise.Groups do
  @moduledoc """
  This module defines the Splitwise.Groups functions
  """

  def list(access_token) do
    Splitwise.Client.get!("/api/v3.0/get_groups", access_token)
  end

  def info(access_token, id) do
    Splitwise.Client.get!("/api/v3.0/get_group/#{id}", access_token)
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
