defmodule ExSplitwise.UsersTest do
  use ExUnit.Case, async: true

  import Mox
  setup :verify_on_exit!

  alias ExSplitwise.{Client.Response, Users}

  setup_all do
    Application.put_env(:ex_splitwise, :consumer_key, "consumer_key")

    Application.put_env(:ex_splitwise, :consumer_secret, "consumer_secret")

    Application.put_env(:ex_splitwise, :redirect_uri, "http://localhost:4000/callback")

    :ok
  end

  describe "current/0" do
    test "gets the current user" do
      result = %{body: "{}", status_code: 200, headers: []}

      ExSplitwise.HttpMock
      |> expect(:get!, fn _, _ -> result end)

      assert %Response{body: %{}, status: 200, headers: []} == Users.current()
    end
  end

  describe "get/1" do
    test "gets user by id" do
      result = %{body: "{}", status_code: 200, headers: []}

      ExSplitwise.HttpMock
      |> expect(:get!, fn _, _ -> result end)

      assert %Response{body: %{}, status: 200, headers: []} == Users.get(1000)
    end
  end

  describe "update/2" do
    test "updates user" do
      result = %{body: "{}", status_code: 200, headers: []}

      ExSplitwise.HttpMock
      |> expect(:post!, fn _, _, _ -> result end)

      assert %Response{body: %{}, status: 200, headers: []} ==
               Users.update(1000, %{first_name: "new"})
    end
  end
end
