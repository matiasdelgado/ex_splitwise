Application.ensure_all_started(:mox)

Mox.defmock(ExSplitwise.HttpMock, for: HTTPoison.Base)

ExUnit.start()
