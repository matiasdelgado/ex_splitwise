defmodule ExSplitwise.OAuth2.Client do
  @moduledoc false

  @base_site "https://www.splitwise.com"

  def authorize_url!() do
    OAuth2.Client.authorize_url!(client())
  end

  def get_token!(code) do
    response = OAuth2.Client.get_token!(client(), code: code, client_secret: client().client_secret)

    with {:ok, %{"access_token" => access_token, "token_type" => _}} <- Poison.decode(response.token.access_token) do
      # FIXME: the response from the api contains a json in the access_token rather than the string
      Application.put_env(:ex_splitwise, :access_token, access_token)

      {:ok, access_token}
    else
      _ -> :error
    end
  end

  def access_token() do
    Application.get_env(:ex_splitwise, :access_token)
  end

  defp client() do
    # TODO: validate configuration values
    consumer_key = Application.get_env(:ex_splitwise, :consumer_key, nil)
    consumer_secret = Application.get_env(:ex_splitwise, :consumer_secret, nil)
    redirect_uri = Application.get_env(:ex_splitwise, :redirect_uri, nil)

    OAuth2.Client.new([
      strategy: OAuth2.Strategy.AuthCode,
      client_id: consumer_key,
      client_secret: consumer_secret,
      site: @base_site,
      redirect_uri: redirect_uri
    ])
  end
end
