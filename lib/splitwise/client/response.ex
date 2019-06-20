defmodule Splitwise.Client.Response do
  @moduledoc """
  Response struct, returned by all the functions in the library.
  Includes the decoded JSON `body`, `headers` and `status` code.
  """

  defstruct [
    :body,
    :headers,
    :status
  ]
end
