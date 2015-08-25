defmodule PinglogServer.Log do
  use PinglogServer.Web, :model

  schema "logs" do
    field :network, :string
    field :gateway, :float
    field :google, :float
    field :host, Ecto.UUID

    timestamps
  end

  @required_fields ~w(network gateway google host)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
