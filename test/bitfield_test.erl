-module(bitfield_test).

-include_lib("eunit/include/eunit.hrl").

pack_test() ->
  ?assertEqual(<<164,128>>, bitfield:pack([1,3,6,9], [1,2,3,4,5,6,7,8,9])).

unpack_test() ->
  ?assertEqual([1,3,6,9], bitfield:unpack(<<164,128>>, [1,2,3,4,5,6,7,8,9])).

unpack_single_test() ->
  ?assertEqual([1], bitfield:unpack(<<1>>, [1,2])).
