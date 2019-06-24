defmodule ExSplitwise.OAuth2 do
  @behaviour ExSplitwise.OAuth2.Behaviour

  @impl ExSplitwise.OAuth2.Behaviour
  def authorize_url!(client) do
    OAuth2.Client.authorize_url!(client)
  end

  @impl ExSplitwise.OAuth2.Behaviour
  def get_token!(client, list) do
    OAuth2.Client.get_token!(client, list)
  end

  @impl ExSplitwise.OAuth2.Behaviour
  def new(list) do
    OAuth2.Client.new(list)
  end
end
