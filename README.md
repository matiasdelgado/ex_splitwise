[![Build Status](https://travis-ci.org/matiasdelgado/ex_splitwise.svg?branch=master)](https://travis-ci.org/matiasdelgado/ex_splitwise)

# Splitwise API wrapper

A wrapper for the [Splitwise API](http://dev.splitwise.com/).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `splitwise` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:splitwise, "~> 0.1.0"}
  ]
end
```

## Getting started

1. [Register your application](https://secure.splitwise.com/oauth_clients) to get a key and secret in order to authenticate to the API.
2. Use the key and secret to get a token

  Let the user navigate to the `authorize_url` to enter their credentials:
  ```elixir
    client = Splitwise.OAuth2.Client.new(@key, @secret, @callback_url)
    authorize_url = Splitwise.OAuth2.Client.authorize_url!(client)
  ```

  Get a token with the `code` returned by Splitwise:
  ```elixir
    def callback(conn, params) do
      client = Splitwise.OAuth2.Client.get_token!(client, params["code"])

      conn
      |> put_session(:token, client.token.access_token)
      |> render("index.html")
    end
  ```
3. Make a request (current_user)
  ```elixir
  def user(conn, _params) do
    %{body: user} = 
      get_session(conn, :token)
      |> Splitwise.Users.current()

    json(conn, user)
  end
  ```

## Usage
All the functions return a `%Splitwise.Reponse{}` struct with the following fields:
* body: decoded JSON
* headers: list of headers returned by the server
* status: HTTP status code

## Functions
* [Users](#Users)
* [Groups](#Groups)
* [Friends](#Friends)
* [Expenses](#Expenses)
* [Notifications](#Notifications)
* [Comments](#Comments)
* [Currencies](#Currencies)

### Users
* current
  ```elixir
  %{body: user} = Splitwise.Users.current(token)
  ```
* get
  ```elixir
  %{body: user} = Splitwise.Users.get(token, id)
  ```
* update
  ```elixir
  %{body: user} = Splitwise.Users.get(token, id, data)
  ```
### Expenses
* all
  ```elixir
  %{body: expenses} = Splitwise.Expenses.all(token)
  ```
* get
  ```elixir
  %{body: expense} = Splitwise.Expenses.get(token, id)
  ```
* create
  ```elixir
  %{body: expense} = Splitwise.Expenses.get(token, id)
  ```
* update
  ```elixir
  %{body: expense} = Splitwise.Expenses.update(token, id)
  ```
* delete
  ```elixir
  %{body: expense} = Splitwise.Expenses.delete(token, id)
  ```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/splitwise](https://hexdocs.pm/splitwise).

