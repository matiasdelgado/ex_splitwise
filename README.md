[![Build Status](https://travis-ci.org/matiasdelgado/ex_splitwise.svg?branch=master)](https://travis-ci.org/matiasdelgado/ex_splitwise)
[![Coverage Status](https://coveralls.io/repos/github/matiasdelgado/ex_splitwise/badge.svg?branch=master)](https://coveralls.io/github/matiasdelgado/ex_splitwise?branch=master)

# Splitwise API wrapper

A wrapper for the [Splitwise API](http://dev.splitwise.com/).

## Installation

The package can be installed by adding `ex_splitwise` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_splitwise, "~> 0.2.1"}
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
* get
  ```elixir
  %{body: body} = ExSplitwise.Friends.get(id)
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
* get
  ```elixir
  %{body: body} = ExSplitwise.Comments.get(id)
  ```

### Currencies
* all
  ```elixir
  %{body: body} = ExSplitwise.Currencies.all()
  ```


---
Documentation can be found at [https://hexdocs.pm/ex_splitwise](https://hexdocs.pm/ex_splitwise).

Licensed under the MIT [license](./LICENSE).
