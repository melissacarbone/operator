defmodule Operator.Repo.Migrations.CreateSentEmail do
  use Ecto.Migration

  def change do
    create table(:sent_emails) do
      add :recipient, :string
      add :solidus_user_id, :integer
      add :template, :string

      timestamps
    end
  end
end
