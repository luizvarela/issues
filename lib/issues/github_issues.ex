defmodule Issues.GithubIssues do
  @user_agent [ {"User-agent", "Elixir"} ]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %HTTPoison.Response{ status_code: 200, body: body}}) do
    {:ok, decode_response(body) }
  end
  def handle_response({:ok, %HTTPoison.Response{ status_code: _, body: body}}) do
    { :error, decode_response(body) }
  end
  def handle_response({ %HTTPoison.Error{ reason: reason }}) do
    { :error, reason }
  end

  defp decode_response(response) do
    {_, decoded_response} = JSX.decode(response)
    decoded_response
  end
end
