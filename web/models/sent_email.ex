defmodule Operator.SentEmail do
  use Operator.Web, :model

  schema "sent_emails" do
    field :recipient, :string
    field :solidus_user_id, :integer
    field :template, :string

    timestamps()
  end

  def create_changeset(schema, params \\ :empty) do
    schema
    |> cast(params, [:recipient, :template, :solidus_user_id])
    |> validate_required([:recipient, :template])
  end
end
