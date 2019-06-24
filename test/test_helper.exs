Application.ensure_all_started(:mox)

Mox.defmock(ExSplitwise.HttpMock, for: HTTPoison.Base)
Mox.defmock(ExSplitwise.OAuth2Mock, for: ExSplitwise.OAuth2.Behaviour)

ExUnit.start()
