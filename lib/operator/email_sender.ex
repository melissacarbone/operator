defmodule Operator.EmailSender do

  alias Operator.Mailer
  alias Operator.SentEmail
  alias Operator.Repo

  def send_email(recipient, "shipment_shipped", _additional_info) do
    Mailer.send_email recipient, "Your shipment has shipped", "shipment_shipped.html", %{"shipment_number" => "H1234"}

    attrs = %{ recipient: recipient,
               template: "shipment_shipped",
               solidus_user_id: 123 }
    changeset = SentEmail.create_changeset(%SentEmail{}, attrs)
    changeset |> Repo.insert!
    {:ok}
  end

  def send_email(recipient, unknown_template, _additional_info) do
    {:error, "unknown template #{unknown_template}"}
  end
end
