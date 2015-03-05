-module(bitfield).

-export([pack/2]).
-export([unpack/2]).

-spec pack(list(), list()) -> binary().
pack(Enabled, Enum) when is_list(Enabled) andalso is_list(Enum) ->
  pack(gb_sets:from_list(Enabled), Enum, <<>>).
pack(_, [], Acc) ->
  fill(Acc);
pack(Enabled, [Field|Enum], Acc) ->
  Acc2 = case gb_sets:is_member(Field, Enabled) of
    true -> <<Acc/bitstring, 1:1>>;
    _ -> <<Acc/bitstring, 0:1>>
  end,
  pack(Enabled, Enum, Acc2).

-spec unpack(binary(), list()) -> list().
unpack(Packed, Enum) when is_binary(Packed) andalso is_list(Enum) ->
  unpack(Packed, Enum, []).
unpack(_, [], Acc) ->
  lists:reverse(Acc);
unpack(<<>>, _, Acc) ->
  lists:reverse(Acc);
unpack(<<1:1/little-unsigned, Packed/bitstring>>, [Field|Enum], Acc) ->
  unpack(Packed, Enum, [Field|Acc]);
unpack(<<0:1/little-unsigned, Packed/bitstring>>, [_|Enum], Acc) ->
  unpack(Packed, Enum, Acc).

fill(Bitstring) ->
  Len = 8 - bit_size(Bitstring) rem 8,
  <<Bitstring/bitstring, 0:Len>>.
