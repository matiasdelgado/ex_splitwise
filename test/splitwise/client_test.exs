defmodule ExSplitwise.ClientTest do
  use ExUnit.Case, async: true

  import Mox
  setup :verify_on_exit!

  setup do
    Application.put_env(:ex_splitwise, :access_token, "token")
  end

  describe "get!/1" do
    test "triggers a GET request with headers" do
      url = "/someurl"
      headers = ["Authorization": "Bearer token"]
      result = %{ body: "{}", status_code: 200, headers: [] }

      ExSplitwise.HttpMock
      |> expect(:get!, fn "https://www.splitwise.com/someurl", ^headers -> result end)

      ExSplitwise.Client.get!(url)
    end
  end

  describe "post!/2" do
    test "triggers a POST request with headers" do
      url = "/someurl"
      headers = ["Authorization": "Bearer token"]
      body = %{}
      result = %{ body: "{ \"value\": 1 }", status_code: 200, headers: [] }

      ExSplitwise.HttpMock
      |> expect(:post!, fn
        "https://www.splitwise.com/someurl",
        {:form, ^body},
        ^headers
        -> result end)

      response = ExSplitwise.Client.post!(url, body)
      assert response.body["value"] == 1
    end
  end
end
