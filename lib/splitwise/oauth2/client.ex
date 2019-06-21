defmodule ExSplitwise.OAuth2.Client do
  @moduledoc false

  @base_site "https://www.splitwise.com"

  def new(consumer_key, consumer_secret, redirect_uri) do
    OAuth2.Client.new([
      strategy: OAuth2.Strategy.AuthCode,
      client_id: consumer_key,
      client_secret: consumer_secret,
      site: @base_site,
      redirect_uri: redirect_uri
    ])
  end

  def authorize_url!(client) do
    OAuth2.Client.authorize_url!(client)
  end

  def get_token!(client, code) do
    result = OAuth2.Client.get_token!(client, code: code, client_secret: client.client_secret)

    with {:ok, %{"access_token" => access_token, "token_type" => _}} <- Poison.decode(result.token.access_token) do
      # FIXME: the result from the api contains a json in the access_token rather than the string
      Map.put(client, :token, %OAuth2.AccessToken{
        access_token: access_token
      })
    else
      _ -> client
    end
  end
end
