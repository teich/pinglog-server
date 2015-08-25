defmodule PinglogServer.Repo.Migrations.CreateLog do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :network, :string
      add :gateway, :float
      add :google, :float
      add :host, :uuid

      timestamps
    end

  end
end
