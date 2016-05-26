# Issues

A small Elixir project to fetch issues from Github

## How to run

```
  mix escript.build
  ./issues dynamo dynamo 2

  num | created_at           | title
----+----------------------+-------------------------------------------------------------------------------------
104 | 2013-07-26T18:57:18Z | Include params from url encoded post body with call to Dynamo.Connection.Test.params
108 | 2013-07-29T13:56:14Z | Part of a template content section gets rerendered in template body
```

```
./issues -help
```
