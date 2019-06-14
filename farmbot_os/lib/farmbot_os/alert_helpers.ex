defmodule FarmbotOS.AlertHelpers do
  def firmware_missing(package) when package in ~w(arduino farmduino farmduino_k14 express_k10) do
    %{
      kind: :rpc_request,
      args: %{label: "findme"},
      body: [%{kind: :flash_firmware, args: %{package: package}}]
    }
    |> FarmbotCeleryScript.AST.decode()
    |> FarmbotCeleryScript.execute("findme")
  end
end
