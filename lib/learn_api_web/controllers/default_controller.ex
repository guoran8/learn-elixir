defmodule LearnApiWeb.DefaultController do
  use LearnApiWeb, :controller

  def index(conn, _params) do
    text(conn, "The server is running - #{Mix.env()}")
  end
end
