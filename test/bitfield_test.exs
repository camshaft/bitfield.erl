defmodule Bitfield.Test do  
  use ExUnit.Case
  use ExCheck

  defp enabled_enums do
    bind(list(int()), fn(enum) ->
      enum = Enum.uniq(enum)
      enabled = Enum.filter(enum, fn(_) -> :random.uniform() > 0.5 end)
      {enabled, enum}
    end)
  end

  property :bitfield do
    for_all test_case in enabled_enums() do
      {enabled, enum} = test_case
      actual = enabled
      |> Bitfield.pack(enum)
      |> Bitfield.unpack(enum)
      enabled == actual
    end
  end
end