defmodule PinglogServer.PingTest do
  use PinglogServer.ModelCase

  alias PinglogServer.Ping

  @valid_attrs %{gateway: "120.5", google: "120.5", host: "7488a646-e31f-11e4-aace-600308960662", network: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ping.changeset(%Ping{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ping.changeset(%Ping{}, @invalid_attrs)
    refute changeset.valid?
  end
end
