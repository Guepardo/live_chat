defmodule LiveChatWeb.ChangesetView do
  use LiveChatWeb, :view

  def render("error.json", %{changeset: changeset}) do
    # TODO: transverse erros from changeset later.
    %{
      status: :error,
    }
  end
end
