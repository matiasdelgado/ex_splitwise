[![Build Status](https://travis-ci.org/matiasdelgado/ex_splitwise.svg?branch=master)](https://travis-ci.org/matiasdelgado/ex_splitwise)

# Splitwise API wrapper

A wrapper for the [Splitwise API](http://dev.splitwise.com/).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_splitwise` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_splitwise, "~> 0.1.0"}
  ]
end
```

## Getting started

1. [Register your application](https://secure.splitwise.com/oauth_clients) to get a key and secret in order to authenticate to the API.
2. Use the key and secret to get a token:

  Let the user navigate to the `authorize_url` to enter their credentials:
  ```elixir
    authorize_url = ExSplitwise.OAuth2.Client.authorize_url!()
  ```

  Get a token with the `code` returned by Splitwise:
  ```elixir
    def callback(conn, params) do
      ExSplitwise.OAuth2.Client.get_token!(params["code"])

      render(conn, "index.html")
    end
  ```
3. Make a request (current_user)
  ```elixir
  def user(conn, _params) do
    %{body: body} = ExSplitwise.Users.current()

    json(conn, user)
  end
  ```

## Usage
All the functions return a `%ExSplitwise.Reponse{}` struct with the following fields:
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
  %{body: body} = ExSplitwise.Users.current()
  ```
* get
  ```elixir
  %{body: body} = ExSplitwise.Users.get(id)
  ```
* update
  ```elixir
  %{body: body} = ExSplitwise.Users.update(id, data)
  ```

### Groups
* all
  ```elixir
  %{body: body} = ExSplitwise.Groups.all()
  ```
* get
  ```elixir
  %{body: body} = ExSplitwise.Groups.get(id)
  ```

### Friends
* all
  ```elixir
  %{body: body} = ExSplitwise.Friends.all()
  ```

### Expenses
* all
  ```elixir
  %{body: body} = ExSplitwise.Expenses.all()
  ```
* get
  ```elixir
  %{body: body} = ExSplitwise.Expenses.get(id)
  ```
* create
  ```elixir
  %{body: body} = ExSplitwise.Expenses.create(data)
  ```
* update
  ```elixir
  %{body: body} = ExSplitwise.Expenses.update(id)
  ```
* delete
  ```elixir
  %{body: body} = Splitwise.Expenses.delete(id)
  ```

### Notifications
* all
  ```elixir
  %{body: body} = ExSplitwise.Notifications.all()
  ```

### Comments

### Currencies


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/splitwise](https://hexdocs.pm/splitwise).

