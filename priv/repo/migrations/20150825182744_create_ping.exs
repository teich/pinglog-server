defmodule PinglogServer.Repo.Migrations.CreatePing do
  use Ecto.Migration

  def change do
    create table(:pings) do
      add :network, :string
      add :gateway, :float
      add :google, :float
      add :host, :uuid

      timestamps
    end

  end
end
