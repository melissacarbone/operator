defmodule Operator.EmailController do
  use Operator.Web, :controller

  alias Operator.SentEmail
  alias Operator.EmailSender

  def index conn, _params do
    sent_emails = SentEmail |> Repo.all
    render conn, %{sent_emails: sent_emails}
  end

  def new conn, _params do
    render conn, %{email_templates: email_templates }
  end

  def send conn, %{"template" => template} do
    case EmailSender.send_email("desmond.bowe@casper.com", template, %{}) do
      {:ok} ->
        conn
        |> put_flash(:info, "Email #{template} sent")
        |> redirect(to: email_path(conn, :index))
      {:error, msg} ->
        conn
        |> put_flash(:error, "Email not sent: #{msg}")
        |> render("new.html", %{email_templates: email_templates })
    end
  end

  def preview conn, %{"template" => template} do
    render conn, "#{template}.html", %{vars: %{shipment_number: "H1234"} }
  end

  defp email_templates do
    ["shipment_shipped", "rando_template"]
  end
end
