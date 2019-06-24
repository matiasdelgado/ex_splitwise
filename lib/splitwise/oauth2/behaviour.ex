defmodule ExSplitwise.OAuth2.Behaviour do
  @moduledoc false

  @type authorize_url :: binary
  @type body :: any
  @type client_id :: binary
  @type client_secret :: binary
  @type headers :: [{binary, binary}]
  @type param :: binary | %{binary => param} | [param]
  @type params :: %{binary => param} | Keyword.t()
  @type redirect_uri :: binary
  @type ref :: reference | nil
  @type request_opts :: Keyword.t()
  @type serializers :: %{binary => module}
  @type site :: binary
  @type strategy :: module
  @type token :: AccessToken.t() | nil
  @type token_method :: :post | :get | atom
  @type token_url :: binary

  @typep client :: %{
           authorize_url: authorize_url,
           client_id: client_id,
           client_secret: client_secret,
           headers: headers,
           params: params,
           redirect_uri: redirect_uri,
           ref: ref,
           request_opts: request_opts,
           serializers: serializers,
           site: site,
           strategy: strategy,
           token: token,
           token_method: token_method,
           token_url: token_url
         }

  @callback authorize_url!(client) :: binary
  @callback get_token!(client, list) :: client
  @callback new(Keyword.t) :: client
end
