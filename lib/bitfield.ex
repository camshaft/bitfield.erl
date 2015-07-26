defmodule Bitfield do
  defdelegate pack(enabled, enum), to: :bitfield
  defdelegate unpack(packed, enum), to: :bitfield
end