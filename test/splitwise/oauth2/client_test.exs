defmodule Splitwise.OAuth2.ClientTest do
  use ExUnit.Case, async: true

  import Mox
  setup :verify_on_exit!

  describe "authorize_url!/0" do
    test "it calls the authorize_url! from the OAuth client" do
      result = "authorize url"

      ExSplitwise.OAuth2Mock
      |> expect(:authorize_url!, fn _client -> result end)

      assert ExSplitwise.OAuth2.Client.authorize_url!() == result
    end
  end

  describe "get_token!/1" do
    test "it calls the get_token! from the OAuth client" do
      code = "code"
      access_token = "access_token"
      result = %{token: %{access_token: "{ \"access_token\": \"#{access_token}\", \"token_type\": \"bearer\" }"}}

      ExSplitwise.OAuth2Mock
      |> expect(:get_token!, fn _client, [code: ^code, client_secret: _] -> result end)

      assert {:ok, access_token} == ExSplitwise.OAuth2.Client.get_token!(code)
    end
  end
end
